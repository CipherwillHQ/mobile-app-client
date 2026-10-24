// Retains the newest three uploaded release artifacts independently per platform.
// Owns paginated artifact planning and deletion through the supplied GitHub client.
// Does not delete debug artifacts, workflow runs or GitHub release assets.
const releasePrefixes = ['android-release-', 'ios-release-'];
const retainedCount = 3;

export function releaseArtifactPlan(artifacts) {
  const unique = [...new Map(artifacts.map(artifact => [artifact.id, artifact])).values()];
  return releasePrefixes.map(prefix => {
    const releases = unique
      .filter(artifact => !artifact.expired && artifact.name.startsWith(prefix))
      .sort((left, right) => Date.parse(right.created_at) - Date.parse(left.created_at) || right.id - left.id);
    return {
      platform: prefix.split('-')[0],
      keep: releases.slice(0, retainedCount),
      remove: releases.slice(retainedCount),
    };
  });
}

export async function cleanupReleaseArtifacts({github, context, core, dryRun = false}) {
  const repository = context.repo;
  const artifacts = await github.paginate(github.rest.actions.listArtifactsForRepo, {
    ...repository, per_page: 100,
  });
  const plan = releaseArtifactPlan(artifacts);
  for (const {platform, keep, remove} of plan) {
    core.info(`${platform}: keeping ${keep.length}; ${dryRun ? 'would delete' : 'deleting'} ${remove.length}.`);
    for (const artifact of keep) core.info(`Keep ${artifact.name} (${artifact.id}).`);
    for (const artifact of remove) {
      if (dryRun) {
        core.info(`Would delete ${artifact.name} (${artifact.id}).`);
        continue;
      }
      try {
        await github.rest.actions.deleteArtifact({...repository, artifact_id: artifact.id});
        core.info(`Deleted ${artifact.name} (${artifact.id}).`);
      } catch (error) {
        if (error.status !== 404) throw error;
        core.info(`${artifact.name} (${artifact.id}) was already removed.`);
      }
    }
  }
  return plan;
}
