# Staatsarchiv Basel-Stadt Linked Data Model - Overview

This document provides an overview of the **Records in Context (RiC-O)** based linked data model used by the Staatsarchiv Basel-Stadt (State Archives of Basel-Stadt, Switzerland).

## Table of Contents

1. [Introduction](#introduction)
2. [Core Ontologies](#core-ontologies)
3. [Data Model Structure](#data-model-structure)
4. [Key Concepts](#key-concepts)
5. [Vocabularies](#vocabularies)
6. [URI Patterns](#uri-patterns)
7. [Related Documentation](#related-documentation)

---

## Introduction

The Staatsarchiv Basel-Stadt Linked Data Pipeline transforms archival metadata from JSON format into RDF triples using the **Records in Context (RiC-O)** ontology as its foundation. RiC-O is an international standard developed by the International Council on Archives (ICA) for describing archival records in a linked data environment.

This data model extends RiC-O with **StABS-specific vocabularies** and **custom properties** to accommodate the unique requirements of the Basel-Stadt archives.

### Key Features

- **RiC-O Compliant**: Based on the Records in Context ontology (version 1.1)
- **Linked Data Principles**: Uses dereferenceable URIs and standard vocabularies
- **Multilingual**: Supports German (primary) and English labels
- **Hierarchical Structure**: Models archival hierarchies (Archiv → Abteilung → Fonds → Bestand → Serie → Dossier → Record)
- **Rich Metadata**: Captures provenance, extent, dates, access conditions, and more
- **Digital Preservation**: Integrates with PREMIS for digital object metadata

---

## Core Ontologies

### Primary Ontology

| Prefix | Namespace | Description |
|--------|-----------|-------------|
| `rico` | `https://www.ica.org/standards/RiC/ontology#` | Records in Context ontology - the foundation |

### Supporting Ontologies

| Prefix | Namespace | Description |
|--------|-----------|-------------|
| `rdf` | `http://www.w3.org/1999/02/22-rdf-syntax-ns#` | RDF core |
| `rdfs` | `http://www.w3.org/2000/01/rdf-schema#` | RDF Schema |
| `xsd` | `http://www.w3.org/2001/XMLSchema#` | XML Schema datatypes |
| `skos` | `http://www.w3.org/2004/02/skos/core#` | Simple Knowledge Organization System |
| `dcterms` | `http://purl.org/dc/terms/` | Dublin Core Terms |
| `premis` | `http://www.loc.gov/premis/rdf/v3/` | PREMIS preservation metadata |
| `ebucore` | `http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#` | EBU Core metadata for audiovisual |
| `schema` | `http://schema.org/` | Schema.org |
| `iiif` | `http://iiif.io/api/presentation/3#` | IIIF Presentation API |

### StABS-Specific Extensions

| Prefix | Namespace | Description |
|--------|-----------|-------------|
| `stabs-rico` | `https://ld.bs.ch/ontologies/StABS-RiC/` | StABS extensions to RiC-O |
| `stabs-rst` | `https://ld.bs.ch/RiC/vocabularies/recordSetTypes/` | Record Set Types vocabulary |
| `stabs-art` | `https://ld.bs.ch/RiC/vocabularies/archivalTypes/` | Archival Types vocabulary |
| `stabs-ext` | `https://ld.bs.ch/RiC/vocabularies/extentTypes/` | Extent Types vocabulary |
| `stabs-crt` | `https://ld.bs.ch/RiC/vocabularies/carrierTypes/` | Carrier Types vocabulary |
| `stabs-fit` | `https://ld.bs.ch/RiC/vocabularies/filmTypes/` | Film Types vocabulary |
| `stabs-idt` | `https://ld.bs.ch/RiC/vocabularies/identifierTypes/` | Identifier Types vocabulary |
| `stabs-acr` | `https://ld.bs.ch/RiC/vocabularies/acRules/` | Access Rules vocabulary |
| `stabs-crs` | `https://ld.bs.ch/RiC/vocabularies/crStatus/` | Copyright Status vocabulary |
| `stabs-rpt` | `https://ld.bs.ch/RiC/vocabularies/representationTypes/` | Representation Types vocabulary |
| `stabs-tht` | `https://ld.bs.ch/RiC/vocabularies/thesaurusTypes/` | Thesaurus Types vocabulary |

---

## Data Model Structure

The data model is organized around the following core RiC-O classes:

### Main Entity Classes

1. **`rico:RecordResource`** - The primary class for archival records (Verzeichnungseinheiten)
   - Represents individual archival items or aggregations
   - Can be specialized as `rico:Record`, `rico:RecordSet`, etc.

2. **`rico:RecordSet`** - A set of records with a common provenance or function
   - Specialized types: Archiv, Abteilung, Fonds, Bestand, Serie, Dossier

3. **`rico:Record`** - Individual record within a RecordSet

4. **`rico:Agent`** - Entities (persons, organizations) associated with records

5. **`rico:Place`** - Geographic locations

6. **`rico:Date`** - Temporal information

7. **`rico:Instantiation`** - Physical or digital manifestations of records
   - Digital: IIIF Manifests, File Collections
   - Analogue: Films, Videos, Audio recordings

8. **`rico:Identifier`** - Unique identifiers for records

9. **`rico:Extent`** - Physical or logical extent measurements

### Hierarchical Relationships

The archival hierarchy is modeled using:
- `rico:isDirectlyIncludedIn` / `rico:directlyIncludes` - Direct parent-child relationships
- `rico:isOrWasIncludedIn` / `rico:includesOrIncluded` - Broader hierarchical relationships

---

## Key Concepts

### Record Types (stabs-rst)

The StABS uses a hierarchical classification system:

```
Archiv (Top-level collection)
  └── Abteilung (Department)
      └── Fonds (Fonds - records from a provenance entity)
          └── Bestand (Series/Group)
              └── Serie (File series)
                  └── Dossier (File/Dossier)
                      └── Record (Individual document)
```

### Archival Types (stabs-art)

Classifies the nature of archival materials:
- **Akte** (File/Folder)
- **Urkunde** (Deed/Charter)
- **Bild** (Image/Photograph)
- **Plan** (Plan/Drawing)
- **Bewegtbild** (Moving Image/Film)
- **Tonaufzeichnung** (Audio Recording)
- **Drucksache** (Printed Matter)
- **Mikroform** (Microform)
- **Objekt** (Object/Artifact)
- **Digitales Speichermedium** (Digital Storage Medium)
- **Plakat** (Poster)
- **Datei** (Computer File)
- **Netzressource** (Web Resource)

### Extent Types (stabs-ext)

Measures the physical or logical size:
- **Laufmeter** (Running meters) - Physical linear measurement
- **Anzahl** (Number/Count) - Number of units
- **Anzahl_Dateien** (Number of files) - Digital file count
- **Datenvolumen_MB** (Data volume in MB) - Digital storage size
- **Dauer** (Duration) - Time duration (e.g., playback time)
- **Umfang_approximativ** (Approximate extent) - Estimated extent

### Access and Use Rules (stabs-acr, stabs-crs)

Controls access to archival materials:
- **Access Rules (stabs-acr):**
  - `freeonline` - Freely available online
  - `orderablerr` - Orderable for reading room access
  - `orderablerp` - Orderable for reproduction
  - `protected` - Protected access

- **Copyright Status (stabs-crs):**
  - `pd` - Public Domain
  - `sa` - State Archives Basel-Stadt
  - `un` - Unknown
  - `cr` - Creator
  - `or` - Orphaned work

### Instantiation Types

Records can have multiple instantiations:
- **Digital Instantiations:**
  - IIIF Manifests (for images)
  - File Collections (PDF, audio, video, text, WARC)
  - Public storage locations

- **Analogue Instantiations:**
  - Film instantiations (various film types)
  - Video instantiations

---

## Vocabularies

The data model uses several controlled vocabularies:

| Vocabulary | Purpose | Classes/Terms |
|------------|---------|---------------|
| `stabs-rst` | Record Set Types | Archiv, Abteilung, Fonds, Bestand, Serie, Dossier, BibRes |
| `stabs-art` | Archival Types | 14 types of archival materials |
| `stabs-ext` | Extent Types | 6 types of extent measurements |
| `stabs-crt` | Carrier Types | Film carrier materials (Cellulose nitrate, acetate, polyester, etc.) |
| `stabs-fit` | Film Types | 25+ film element types |
| `stabs-idt` | Identifier Types | Old signature, previous signature, previous StABS signature |
| `stabs-acr` | Access Rules | 4 access categories |
| `stabs-crs` | Copyright Status | 5 copyright statuses |
| `stabs-rpt` | Representation Types | IIIF Type, File Collection Type |
| `stabs-tht` | Thesaurus Types | Personenbegriffe (Person concepts), Ortsbegriffe (Place concepts) |

See [VOCABULARIES.md](./VOCABULARIES.md) for detailed vocabulary documentation.

---

## URI Patterns

All entities are identified using persistent, dereferenceable URIs following consistent patterns:

### Base Pattern
```
https://ld.bs.ch/ais/{EntityType}/{Identifier}
```

### Specific Patterns

| Entity Type | URI Pattern | Example |
|-------------|-------------|---------|
| Record Resource | `https://ld.bs.ch/ais/Record/{ID_NR}` | `https://ld.bs.ch/ais/Record/12345` |
| Agent | `https://ld.bs.ch/ais/Agent/{ID}` | `https://ld.bs.ch/ais/Agent/A001` |
| Place | `https://ld.bs.ch/ais/Place/{ID}` | `https://ld.bs.ch/ais/Place/P001` |
| Instantiation | `https://ld.bs.ch/ais/Instantiation/{ID}-{type}` | `https://ld.bs.ch/ais/Instantiation/12345-fr01` |
| File | `https://ld.bs.ch/ais/File/{ID}` | `https://ld.bs.ch/ais/File/file123` |
| Date | `https://ld.bs.ch/ais/Date/{ID}` | `https://ld.bs.ch/ais/Date/12345` |
| Identifier | `https://ld.bs.ch/ais/Record/{ID}/Old-Reference/{value}` | `https://ld.bs.ch/ais/Record/123/Old-Reference/ABC123` |

See [URI-PATTERNS.md](./URI-PATTERNS.md) for complete URI pattern documentation.

---

## Related Documentation

- [CLASS-DOCUMENTATION.md](./CLASS-DOCUMENTATION.md) - Detailed class descriptions
- [PROPERTY-DOCUMENTATION.md](./PROPERTY-DOCUMENTATION.md) - Detailed property descriptions
- [VOCABULARIES.md](./VOCABULARIES.md) - Controlled vocabularies reference
- [URI-PATTERNS.md](./URI-PATTERNS.md) - URI generation patterns
- [MAPPING-DOCUMENTATION.md](./MAPPING-DOCUMENTATION.md) - JSON to RDF mapping details

---

## References

1. **RiC-O Ontology**: [https://www.ica.org/standards/RiC/ontology](https://www.ica.org/standards/RiC/ontology)
2. **RiC-O Documentation**: [https://www.ica.org/standards/RiC](https://www.ica.org/standards/RiC)
3. **PREMIS Data Dictionary**: [https://www.loc.gov/standards/premis/](https://www.loc.gov/standards/premis/)
4. **SKOS Reference**: [https://www.w3.org/TR/skos-reference/](https://www.w3.org/TR/skos-reference/)
5. **Staatsarchiv Basel-Stadt**: [https://staatsarchiv.bs.ch/](https://staatsarchiv.bs.ch/)
6. **DLS (Digital Library System)**: [https://dls.staatsarchiv.bs.ch/](https://dls.staatsarchiv.bs.ch/)

---

*Document generated from XRM mappings and metadata files*
*Last updated: Based on repository state as of analysis date*
