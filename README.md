# Staatsarchiv-BS Linked Data

This pipeline uses [barnard59](https://github.com/zazuko/barnard59) to generate triples from a JSON file using a carml mapping.

To generate the mapping files out of the XRM mappings, you can use [our Expressive RDF Mapper (XRM) tool](https://github.com/zazuko/expressive-rdf-mapper#installation-instructions).

## Quick start

Put your input in a single `input.json` file in the `input` directory.

Then run the following:

```sh
npm install # install dependencies
npm run start # run the pipeline
```

You will find the generated triples in the `output` directory.

## Repository structure

- `input`: should contain some JSON files (not included in this repository) ; it will be used by the pipeline to generate triples
- `mapping`: XRM mapping files, to map fields from the JSON files to specific triples
- `metadata`: some static triples that need to be published
- `node_module`: contains the source code of all dependencies required to run the pipeline ; it should never be pushed
- `output`: contain triple files with the generated triples from the pipeline
- `pipelines`: contains the pipeline definition
- `scripts`: some useful scripts
- `src-gen`: the generated mapping file for carml
- `.gitlab-ci.yml`: the GitLab CI pipeline declaration
- `package.json`: specify the version of each dependency that is used and define some useful scripts

## GitLab CI pipeline

The GitLab CI pipeline is doing the following:

1. `github`: this step is only run on a push on the `main` branch. It pushes the content of the repository we have on GitLab to GitHub.
2. `fetch`: this step fetches the latest JSON file for all prefixes defined in the `scripts/file_prefix.sh` file and will store them in the `input` directory.
3. `process`: there are two main jobs for that step:
   a. `metadata`: this job generates the triples from the Turtle files (extension `.ttl`) that are stored in the `metadata` directory into a `output/metadata.nt` file. That way everything is converted into the right format and is stored into a single file.
   b. `process`: this job splits the JSON files into smaller chunks and run the pipeline on each of them.
4. `store`: this step publishes the generated triples from the previous step (every file with `.nt` extension from the `output` directory) to the triple store.
