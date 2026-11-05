# URI Patterns - Staatsarchiv Basel-Stadt Linked Data Model

This document describes the URI patterns used to identify entities in the Staatsarchiv Basel-Stadt linked data model.

## Table of Contents

1. [Overview](#overview)
2. [Base URI Structure](#base-uri-structure)
3. [Entity URI Patterns](#entity-uri-patterns)
4. [Template Definitions](#template-definitions)
5. [URI Examples](#uri-examples)
6. [URI Design Principles](#uri-design-principles)

---

## Overview

All entities in the StABS linked data model are identified using **persistent, dereferenceable URIs** that follow consistent patterns. URIs are constructed using templates defined in the XRM mapping files, with variables replaced by actual values from the source JSON data.

### Base Domain

```
https://ld.bs.ch/
```

This is the base domain for all StABS linked data URIs.

---

## Base URI Structure

### General Pattern

```
https://ld.bs.ch/ais/{EntityType}/{Identifier}
```

Where:
- `ais` = Archival Information System
- `{EntityType}` = Type of entity (Record, Agent, Place, etc.)
- `{Identifier}` = Unique identifier for the entity

---

## Entity URI Patterns

### Record Resources

#### Main Record URI

**Template**: `rrURI`

**Pattern**:
```
https://ld.bs.ch/ais/Record/{ID_NR}
```

**Description**: Primary URI for archival records (Verzeichnungseinheiten).

**Example**:
```
https://ld.bs.ch/ais/Record/548575
```

---

#### DLS Backlink URI

**Template**: `dlsURI`

**Pattern**:
```
https://dls.staatsarchiv.bs.ch/records/{ID_NR}
```

**Description**: Link back to the Digital Library System (DLS) record.

**Property**: `rdfs:seeAlso`

---

### Dates

#### Record Date URI

**Template**: `rrdateURI`

**Pattern**:
```
https://ld.bs.ch/ais/Record/{ID_NR}/Date
```

**Description**: URI for date information associated with a record.

---

#### ISO Date URI

**Template**: `isoDateURI`

**Pattern**:
```
https://ld.bs.ch/ais/{date_value}
```

**Description**: URI for specific date values (start/end dates).

**Example**:
```
https://ld.bs.ch/ais/2023-01-15
```

---

### Extents

#### Generic Extent URI

**Template**: `exURI`

**Pattern**:
```
https://ld.bs.ch/ais/Extent/{ID_NR}
```

---

#### Linear Meters Extent URI

**Template**: `exlmURI`

**Pattern**:
```
https://ld.bs.ch/ais/Record/{ID_NR}/Extent/linear-meters
```

---

#### Duration Extent URI

**Template**: `exdurURI`

**Pattern**:
```
https://ld.bs.ch/ais/Record/{ID_NR}/Extent/duration
```

---

#### Number of Units Extent URI

**Template**: `exnumURI`

**Pattern**:
```
https://ld.bs.ch/ais/Record/{ID_NR}/Extent/number-of-units
```

---

#### Number of Files Extent URI

**Template**: `exnumfileURI`

**Pattern**:
```
https://ld.bs.ch/ais/Record/{ID_NR}/Extent/number-of-files
```

---

#### Approximate Extent URI

**Template**: `exapproxURI`

**Pattern**:
```
https://ld.bs.ch/ais/Record/{ID_NR}/Extent/extent-approximative
```

---

#### Data Volume Extent URI

**Template**: `exdvURI`

**Pattern**:
```
https://ld.bs.ch/ais/Record/{ID_NR}/Extent/volume-of-data
```

---

### Identifiers

#### Old Reference URI

**Template**: `oldrefURI`

**Pattern**:
```
https://ld.bs.ch/ais/Record/{ID_NR}/Old-Reference/{ALTE_SIGNATUREN}
```

---

#### Former Reference URI

**Template**: `frmrefURI`

**Pattern**:
```
https://ld.bs.ch/ais/Record/{ID_NR}/Former-Reference/{FRUEHERE_SIGNATUR}
```

---

#### Former StABS Reference URI

**Template**: `frmstabsrefURI`

**Pattern**:
```
https://ld.bs.ch/ais/Record/{ID_NR}/Former-StABS-Reference/{FRUEHERE_STABS_SIGNATUR}
```

---

### Instantiations

#### Digital Instantiation URI

**Template**: `freedigiinstURI`

**Pattern**:
```
https://ld.bs.ch/ais/Instantiation/{ID_NR}-fr01
```

**Suffix**: `-fr01` indicates "free digital instantiation 1"

---

#### Video Instantiation URI

**Template**: `videoinstURI`

**Pattern**:
```
https://ld.bs.ch/ais/Instantiation/{ID_NR}-vi01
```

---

#### Film Instantiation URI

**Template**: `filminstURI`

**Pattern**:
```
https://ld.bs.ch/ais/Instantiation/{ID_NR}-fi01
```

---

#### Analogue Instantiation URI

**Template**: `anainstURI`

**Pattern**:
```
https://ld.bs.ch/ais/Instantiation/{ID_NR}-an01
```

---

### Files and Storage

#### File URI

**Template**: `fileURI`

**Pattern**:
```
https://ld.bs.ch/ais/File/{identifier}
```

---

#### Storage Location URI

**Template**: `storageURI`

**Pattern**:
```
https://ld.bs.ch/ais/File/{identifier}/Location
```

---

#### Content Location URI

**Template**: `contentLocationURI`

**Pattern**:
```
https://sos-ch-dk-2.exo.io/hfp-stabs-dls/{s3_path}{original_filename}
```

**Note**: This uses a different domain for public access.

---

### IIIF and Manifests

#### Manifest URI

**Template**: `manifestURI`

**Pattern**:
```
https://dls.staatsarchiv.bs.ch/api/records/manifest/?identifier={identifier}
```

**Property**: `schema:url`

---

#### Viewer URI

**Template**: `viewerURI`

**Pattern**:
```
https://dls.staatsarchiv.bs.ch/records/{ID_NR}/{identifier}/preview
```

**Property**: `rdfs:seeAlso`

---

### Agents, Places, Events, Dates, Rules

#### Agent URI

**Template**: `agURI`

**Pattern**:
```
https://ld.bs.ch/ais/Agent/{identifier}
```

---

#### Event URI

**Template**: `evURI`

**Pattern**:
```
https://ld.bs.ch/ais/Event/{identifier}
```

---

#### Rule URI

**Template**: `ruURI`

**Pattern**:
```
https://ld.bs.ch/ais/Rule/{identifier}
```

---

#### Place URI

**Template**: `plURI`

**Pattern**:
```
https://ld.bs.ch/ais/Place/{identifier}
```

---

#### Date URI (standalone)

**Template**: `daURI`

**Pattern**:
```
https://ld.bs.ch/ais/Date/{identifier}
```

---

### Bibliographic Resources

#### Bibliographic Resource URI

**Template**: `bibURI`

**Pattern**:
```
https://ld.bs.ch/ais/Record/{ID_NR}/BibliographicResource
```

---

### Generic Thing URI

**Template**: `thURI`

**Pattern**:
```
https://ld.bs.ch/ais/Thing/{identifier}
```

---

## Template Definitions

All URI templates are defined in `mappings/template-iris.xrm`:

```xrm
/* Base Subject URI templates fuer RDF StABS */

/* Thing URI */
template thURI "https://ld.bs.ch/ais/Thing/{0}"

/* Record Resources */
template rrURI "https://ld.bs.ch/ais/Record/{0}"
template oldrefURI "https://ld.bs.ch/ais/Record/{0}/Old-Reference/{1}"
template frmrefURI "https://ld.bs.ch/ais/Record/{0}/Former-Reference/{1}"
template frmstabsrefURI "https://ld.bs.ch/ais/Record/{0}/Former-StABS-Reference/{1}"
template rrdateURI "https://ld.bs.ch/ais/Record/{0}/Date"
template isoDateURI "https://ld.bs.ch/ais/{0}"

/* Extents */
template exURI "https://ld.bs.ch/ais/Extent/{0}"
template exlmURI "https://ld.bs.ch/ais/Record/{0}/Extent/linear-meters"
template exdurURI "https://ld.bs.ch/ais/Record/{0}/Extent/duration"
template exnumURI "https://ld.bs.ch/ais/Record/{0}/Extent/number-of-units"
template exnumfileURI "https://ld.bs.ch/ais/Record/{0}/Extent/number-of-files"
template exapproxURI "https://ld.bs.ch/ais/Record/{0}/Extent/extent-approximative"
template exdvURI "https://ld.bs.ch/ais/Record/{0}/Extent/volume-of-data"

/* Instantiations */
template freedigiinstURI "https://ld.bs.ch/ais/Instantiation/{0}-fr01"
template videoinstURI "https://ld.bs.ch/ais/Instantiation/{0}-vi01"
template filminstURI "https://ld.bs.ch/ais/Instantiation/{0}-fi01"
template anainstURI "https://ld.bs.ch/ais/Instantiation/{0}-an01"

/* Files */
template bibURI "https://ld.bs.ch/ais/Record/{0}/BibliographicResource"
template fileURI "https://ld.bs.ch/ais/File/{0}"
template storageURI "https://ld.bs.ch/ais/File/{0}/Location"
template contentLocationURI "https://sos-ch-dk-2.exo.io/hfp-stabs-dls/{0}{1}"

/* DLS Links */
template dlsURI "https://dls.staatsarchiv.bs.ch/records/{0}"
template manifestURI "https://dls.staatsarchiv.bs.ch/api/records/manifest/?identifier={0}"
template viewerURI "https://dls.staatsarchiv.bs.ch/records/{0}/{1}/preview"

/* Other entities */
template agURI "https://ld.bs.ch/ais/Agent/{0}"
template evURI "https://ld.bs.ch/ais/Event/{0}"
template ruURI "https://ld.bs.ch/ais/Rule/{0}"
template plURI "https://ld.bs.ch/ais/Place/{0}"
template daURI "https://ld.bs.ch/ais/Date/{0}"
```

---

## URI Examples

### Record Hierarchy Example

```
Archiv: https://ld.bs.ch/ais/Record/548575
Abteilung: https://ld.bs.ch/ais/Record/1001
Fonds: https://ld.bs.ch/ais/Record/2001
Bestand: https://ld.bs.ch/ais/Record/3001
Serie: https://ld.bs.ch/ais/Record/4001
Dossier: https://ld.bs.ch/ais/Record/5001
```

### Record with Full Metadata Example

```
Record: https://ld.bs.ch/ais/Record/12345
├── DLS Link: https://dls.staatsarchiv.bs.ch/records/12345 (rdfs:seeAlso)
├── Date: https://ld.bs.ch/ais/Record/12345/Date
│   ├── Start: https://ld.bs.ch/ais/1950-01-01
│   └── End: https://ld.bs.ch/ais/1950-12-31
├── Extent (Linear): https://ld.bs.ch/ais/Record/12345/Extent/linear-meters
├── Extent (Files): https://ld.bs.ch/ais/Record/12345/Extent/number-of-files
├── Identifier (Old): https://ld.bs.ch/ais/Record/12345/Old-Reference/ABC123
├── Digital Instantiation: https://ld.bs.ch/ais/Instantiation/12345-fr01
│   ├── Manifest: https://dls.staatsarchiv.bs.ch/api/records/manifest/?identifier=file123
│   └── Viewer: https://dls.staatsarchiv.bs.ch/records/12345/file123/preview
└── Bibliographic Resource: https://ld.bs.ch/ais/Record/12345/BibliographicResource
```

---

## URI Design Principles

1. **Persistence**: URIs are designed to be persistent - once assigned, they should never change or be reused.
2. **Dereferenceability**: All URIs should be dereferenceable, returning RDF descriptions.
3. **Opacity**: URIs are opaque - their structure should not be parsed for meaning.
4. **Hierarchy**: URIs reflect hierarchical relationships where appropriate.
5. **Uniqueness**: Each entity has a unique URI within the StABS namespace.
6. **Cool URIs**: Following Tim Berners-Lee's principle: "Cool URIs don't change".
7. **Linked Data Principles**: Use HTTP URIs, provide useful information when dereferenced, include links to other URIs.

---

## Related Files

- `mappings/template-iris.xrm` - URI template definitions
- `src-gen/mapping.carml.ttl` - Generated CARML mapping with URI templates
- `pipelines/main.ttl` - Pipeline configuration

---

*See [DATAMODEL-OVERVIEW.md](./DATAMODEL-OVERVIEW.md) for the big picture*
*See [CLASS-DOCUMENTATION.md](./CLASS-DOCUMENTATION.md) for class details*
*See [PROPERTY-DOCUMENTATION.md](./PROPERTY-DOCUMENTATION.md) for property details*
*See [VOCABULARIES.md](./VOCABULARIES.md) for vocabulary terms*
