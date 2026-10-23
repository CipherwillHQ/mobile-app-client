// Exports the existing backend schema and validates mobile GraphQL operations.
// Owns schema snapshots and contract drift checks.
// Does not initialize the backend, database, or Firebase.
import { execFileSync } from 'node:child_process';
import { readFileSync, writeFileSync, readdirSync } from 'node:fs';
import { resolve, dirname } from 'node:path';
import { fileURLToPath } from 'node:url';
import { createRequire } from 'node:module';
const root = resolve(dirname(fileURLToPath(import.meta.url)), '..');
const backend = resolve(process.env.CIPHERWILL_BACKEND_PATH || resolve(root, '../cipherwill-backend'));
const require = createRequire(resolve(backend, 'package.json'));
const { buildSchema, parse, validate } = require('graphql');
const script = "import defs from './src/typeDefs/index.ts'; import {buildASTSchema,printSchema} from 'graphql'; console.log(printSchema(buildASTSchema(defs)));";
const schemaText = execFileSync(process.execPath, ['--import','tsx','--input-type=module','-e',script], {cwd:backend,encoding:'utf8'});
const target = resolve(root, 'lib/core/api/schema.graphql');
if (process.argv.includes('--check')) {
  if (readFileSync(target,'utf8') !== schemaText) throw Error('Backend GraphQL schema drift; run node tool/export_backend_schema.mjs');
} else writeFileSync(target,schemaText);
const schema = buildSchema(schemaText);
for (const name of readdirSync(resolve(root,'lib/core/api/operations'))) {
  if (!name.endsWith('.graphql') || name === 'schema.graphql') continue;
  const errors = validate(schema,parse(readFileSync(resolve(root,'lib/core/api/operations',name),'utf8')));
  if (errors.length) throw Error(name+': '+errors.map(e=>e.message).join('; '));
}
console.log('Backend schema and mobile operations are compatible.');
