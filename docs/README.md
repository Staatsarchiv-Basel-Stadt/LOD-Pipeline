# Staatsarchiv Basel-Stadt Linked Data Model - Documentation

This directory contains comprehensive documentation for the **Staatsarchiv Basel-Stadt (State Archives of Basel-Stadt, Switzerland) Linked Data Model**.

## Overview

The Staatsarchiv Basel-Stadt uses a **Records in Context (RiC-O)** based linked data model to describe archival materials. This documentation provides a complete reference for understanding and working with the data model.

## Documentation Files

| File | Description | Size |
|------|-------------|------|
| [DATAMODEL-OVERVIEW.md](./DATAMODEL-OVERVIEW.md) | High-level overview of the data model | ~11KB |
| [CLASS-DOCUMENTATION.md](./CLASS-DOCUMENTATION.md) | Detailed class descriptions | ~13KB |
| [PROPERTY-DOCUMENTATION.md](./PROPERTY-DOCUMENTATION.md) | Detailed property descriptions | ~15KB |
| [VOCABULARIES.md](./VOCABULARIES.md) | Controlled vocabularies reference | ~18KB |
| [URI-PATTERNS.md](./URI-PATTERNS.md) | URI generation patterns | ~15KB |
| [MAPPING-DOCUMENTATION.md](./MAPPING-DOCUMENTATION.md) | JSON to RDF mapping details | ~9KB |

## Quick Start

### For Data Consumers

1. Start with **[DATAMODEL-OVERVIEW.md](./DATAMODEL-OVERVIEW.md)** to understand the big picture
2. Review **[VOCABULARIES.md](./VOCABULARIES.md)** to understand the controlled vocabularies
3. Check **[URI-PATTERNS.md](./URI-PATTERNS.md)** to understand how to construct URIs

### For Developers

1. Read **[DATAMODEL-OVERVIEW.md](./DATAMODEL-OVERVIEW.md)** for context
2. Study **[CLASS-DOCUMENTATION.md](./CLASS-DOCUMENTATION.md)** and **[PROPERTY-DOCUMENTATION.md](./PROPERTY-DOCUMENTATION.md)** for detailed semantics
3. Examine **[MAPPING-DOCUMENTATION.md](./MAPPING-DOCUMENTATION.md)** to understand data transformation
4. Use **[URI-PATTERNS.md](./URI-PATTERNS.md)** and **[VOCABULARIES.md](./VOCABULARIES.md)** as references

### For Data Modelers

All documentation files are relevant. Start with the overview and then dive into the details.

## Data Model Summary

### Core Ontology

- **Primary**: [RiC-O](https://www.ica.org/standards/RiC/ontology) - Records in Context
- **Extensions**: `stabs-rico:` - StABS-specific extensions
- **Vocabularies**: Multiple StABS-specific vocabularies (`stabs-rst:`, `stabs-art:`, etc.)

### Entity Types

| Category | Types | Count |
|----------|-------|-------|
| Record Resources | Record, RecordSet, RecordHGB | 3 |
| Agents | Agent, Person, CorporateBody | 3 |
| Temporal | Date | 1 |
| Spatial | Place | 1 |
| Instantiations | Instantiation (Digital, Analogue) | 2 |
| Identifiers | Identifier | 1 |
| Extents | Extent, RecordResourceExtent | 2 |
| Rules | Rule | 1 |
| Types | Type, RecordSetType, etc. | Multiple |
| Bibliographic | BibliographicResource | 1 |

### Hierarchical Structure

```
Archiv (stabs-rst:Archiv)
  └── Abteilung (stabs-rst:Abteilung)
      └── Fonds (stabs-rst:Fonds)
          └── Bestand (stabs-rst:Bestand)
              └── Serie (stabs-rst:Serie)
                  └── Dossier (stabs-rst:Dossier)
                      └── Record (rico:Record)
```

### Key Vocabularies

| Vocabulary | Terms | Purpose |
|------------|-------|---------|
| stabs-rst | 7 | Record Set Types (hierarchy levels) |
| stabs-art | 14 | Archival Types (material types) |
| stabs-ext | 6 | Extent Types (size measurements) |
| stabs-crt | 5 | Carrier Types (film materials) |
| stabs-fit | 25+ | Film Types (film elements) |
| stabs-idt | 3 | Identifier Types |
| stabs-acr | 4 | Access Rules |
| stabs-crs | 5 | Copyright Status |
| stabs-rpt | 2 | Representation Types |
| stabs-tht | 2 | Thesaurus Types |

## Technology Stack

- **Mapping Language**: [XRM](https://github.com/zazuko/expressive-rdf-mapper) → [CARML](https://carml.taxonic.com/)
- **Processing Engine**: [barnard59](https://github.com/zazuko/barnard59)
- **Query Language**: JSONPath
- **Output Format**: RDF (N-Triples, Turtle)

## Repository Structure

```
LOD-Pipeline/
├── mappings/              # XRM mapping files
│   ├── mapping.xrm        # Main mapping rules
│   ├── sources.xrm        # Source data definitions
│   ├── vocabs.xrm         # Vocabulary definitions
│   └── template-iris.xrm  # URI template definitions
│
├── src-gen/               # Generated files
│   └── mapping.carml.ttl  # Compiled CARML mapping
│
├── pipelines/             # Pipeline configurations
│   └── main.ttl           # Main pipeline definition
│
├── metadata/              # Static metadata (Turtle files)
│   ├── RiC-O_1-1.ttl      # RiC-O ontology
│   ├── stabs.*.ttl        # StABS vocabularies
│   └── void.ttl           # VoID description
│
├── scripts/               # Utility scripts
│   └── generate_triples.sh
│
├── input/                 # Input JSON files (not in repo)
├── output/                # Output RDF files (generated)
│
└── docs/                  # Documentation (this directory)
    ├── DATAMODEL-OVERVIEW.md
    ├── CLASS-DOCUMENTATION.md
    ├── PROPERTY-DOCUMENTATION.md
    ├── VOCABULARIES.md
    ├── URI-PATTERNS.md
    └── MAPPING-DOCUMENTATION.md
```

## How to Use This Documentation

### Finding Information

- **What types of entities exist?** → [CLASS-DOCUMENTATION.md](./CLASS-DOCUMENTATION.md)
- **What properties can I use?** → [PROPERTY-DOCUMENTATION.md](./PROPERTY-DOCUMENTATION.md)
- **What values are valid for a property?** → [VOCABULARIES.md](./VOCABULARIES.md)
- **How is a URI constructed?** → [URI-PATTERNS.md](./URI-PATTERNS.md)
- **How does the mapping work?** → [MAPPING-DOCUMENTATION.md](./MAPPING-DOCUMENTATION.md)
- **What's the big picture?** → [DATAMODEL-OVERVIEW.md](./DATAMODEL-OVERVIEW.md)

## References

### External Resources

- [RiC-O Ontology](https://www.ica.org/standards/RiC/ontology) - Official RiC-O specification
- [RiC-O Documentation](https://www.ica.org/standards/RiC) - RiC-O standard documentation
- [SKOS Reference](https://www.w3.org/TR/skos-reference/) - SKOS specification
- [PREMIS Data Dictionary](https://www.loc.gov/standards/premis/) - PREMIS preservation metadata

### StABS Resources

- [Staatsarchiv Basel-Stadt](https://staatsarchiv.bs.ch/) - Official website
- [DLS (Digital Library System)](https://dls.staatsarchiv.bs.ch/) - Digital access system

---

*These documentation files are stored locally only and have not been pushed to GitHub.*
