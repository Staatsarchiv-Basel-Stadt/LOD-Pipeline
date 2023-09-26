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

- `input`: should contain a `input.json` file (not included in this repository) ; it will be used by the pipeline to generate triples
- `mapping`: XRM mapping files, to map fields from the JSON file to specific triples
- `metadata`: some static triples that need to be published
- `node_module`: contains the source code of all dependencies required to run the pipeline ; it should never be pushed
- `output`: contain a triple file with the generated triples from the pipeline
- `src-gen`: the generated mapping file for carml
- `.gitlab-ci.yml`: the GitLab CI pipeline declaration
- `package.json`: specify the version of each dependency that is used and define some useful scripts

## GitLab CI pipeline

The GitLab CI pipeline is doing the following:

1. `fetch`: this step fetches all JSON files in the S3 bucket and merges them into one file in `input/input.json`.
2. `process`: this step runs the pipeline by using the input from the previous step and generates a `output/transformed.nt` file with the generated triples.
3. `store`: this step publishes the generated triples from the previous step and the triples from the files that are stored in the `metadata` directory.
