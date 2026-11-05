# Mapping Documentation - Staatsarchiv Basel-Stadt Linked Data Pipeline

This document describes how JSON source data is mapped to RDF triples using the XRM and CARML technologies.

## Table of Contents

1. [Overview](#overview)
2. [Mapping Architecture](#mapping-architecture)
3. [Source Data Structure](#source-data-structure)
4. [XRM Mapping Files](#xrm-mapping-files)
5. [Logical Sources](#logical-sources)
6. [Mapping Rules](#mapping-rules)
7. [CARML Generation](#carml-generation)
8. [Pipeline Processing](#pipeline-processing)
9. [Example Mappings](#example-mappings)
10. [Field Reference](#field-reference)

---

## Overview

The Staatsarchiv Basel-Stadt Linked Data Pipeline transforms JSON data into RDF using a two-step process:

1. **XRM to CARML**: XRM (Expressive RDF Mapper) mappings are compiled into CARML (RDF Mapping Language)
2. **CARML to RDF**: The CARML mapping is executed by barnard59 to produce RDF triples

### Technologies

| Technology | Role | Description |
|------------|------|-------------|
| **XRM** | Mapping Definition | Expressive RDF Mapper - high-level mapping language |
| **CARML** | Mapping Language | RDF Mapping Language - W3C standard for R2RML |
| **barnard59** | Execution Engine | Processes CARML mappings to generate RDF |
| **JSONPath** | Data Selection | Query language for selecting JSON data |

---

## Mapping Architecture

```
JSON Source Data
    ↓
XRM Mapping Files (mappings/*.xrm)
    ↓
Compilation (XRM → CARML)
    ↓
Generated CARML (src-gen/mapping.carml.ttl)
    ↓
barnard59 Pipeline (pipelines/main.ttl)
    ↓
RDF Triples (output/*.nt)
```

### File Structure

```
mappings/
├── mapping.xrm          # Main mapping rules
├── sources.xrm          # Source data definitions
├── vocabs.xrm           # Vocabulary definitions
└── template-iris.xrm    # URI template definitions

src-gen/
└── mapping.carml.ttl    # Generated CARML mapping

pipelines/
└── main.ttl             # Pipeline configuration
```

---

## Source Data Structure

### Input Format

The pipeline expects JSON files in the `input/` directory following the StABS archival database schema.

### Example JSON Structure

```json
{
  "ID_NR": "12345",
  "SIGNATUR": "StABS A 1.1",
  "TITEL": "Verwaltungsakten 1950-1960",
  "STUFE": "Dossier",
  "PARENT_ID_NR": "1234",
  "ENTSTEHUNGSZEITRAUM": "1950-1960",
  "created_start": "1950-01-01",
  "created_end": "1960-12-31",
  "LAUFMETER": 0.5,
  "ARCHIVALIENART": ["Akte"],
  "ZUGANGSBESTIMMUNGEN": "Freie Benutzung",
  "files_are_public": true,
  "STATUS_URHEBER_RECHT": "Gemeinfrei"
}
```

---

## XRM Mapping Files

### 1. template-iris.xrm

Defines URI templates for all entity types (see URI-PATTERNS.md).

### 2. vocabs.xrm

Defines vocabularies and their prefixes for RiC-O, SKOS, Dublin Core, PREMIS, EBU Core, Schema.org, IIIF, and StABS-specific vocabularies.

### 3. sources.xrm

Defines logical sources that select specific subsets of the JSON data using JSONPath expressions.

### 4. mapping.xrm

Contains the main mapping rules that define how JSON fields map to RDF properties.

---

## Logical Sources

Logical sources use JSONPath expressions to select subsets of the input data.

### JSONPath Examples

| Pattern | Description | Example |
|---------|-------------|---------|
| `$.*` | All top-level elements | All records |
| `$..[?(@.ID_NR == '548575')]` | Element with specific ID | Archive root |
| `$..[?(@.STUFE =~ /^Abteilung$/)]` | Elements matching regex | All Abteilungen |
| `$..[?(@.LAUFMETER)]` | Elements with specific field | Records with linear meters |

### Logical Source Categories

1. **Hierarchical Level Sources**: rr_arc, rr_abt, rr_fon, rr_bes, rr_ser, rr_dos, rr_dok
2. **Field-Specific Sources**: rr_signaturen, rr_full_date, rr_crea_date, rr_end_date
3. **Extent Sources**: rr_extent_lm, rr_extent_num, rr_extent_num_files, rr_extent_data_vol, rr_extent_approx, rr_extent_as
4. **Instantiation Sources**: free_digital_inst, video_inst, film_inst
5. **Archival Type Sources**: art_10001 through art_13162
6. **Carrier Type Sources**: crt_13029 through crt_13043
7. **Film Type Sources**: fit_13018 through fit_13057
8. **Access Rule Sources**: rr_ar_freeonline, rr_ar_orderablerr, rr_ar_orderablerp, rr_ar_protected
9. **Copyright Status Sources**: rr_cr_pd, rr_cr_sa, rr_cr_un, rr_cr_cr, rr_cr_or
10. **Thesaurus Sources**: ag_desc, pl_desc

---

## Mapping Rules

### Basic Structure

```xrm
map map_name from source_group.logical_source {
  subject template template_name with variable1 variable2;

  types
    Class1
    Class2

  properties
    property1 from FIELD_NAME with language-tag lang;
    property2 from FIELD_NAME with datatype xsd.datatype;
    property3 constant vocabulary:term;
    property4 template template_name with variable as Literal;
}
```

### Property Mapping Types

1. **Direct Field Mapping**: `rico.identifier from SIGNATUR;`
2. **Language-Tagged Literal**: `rico.title from TITEL with language-tag ger;`
3. **Datatype-Typed Literal**: `rico.normalizedDateValue from created_start with datatype xsd.date;`
4. **Constant Value**: `rico.hasRecordSetType constant stabs-rst.Archiv;`
5. **Template-Based Value**: `rico.identifier template "{0}-fr01" with ID_NR as Literal;`
6. **Object Property Linking**: `rico.isDirectlyIncludedIn template rrURI with PARENT_ID_NR;`

---

## CARML Generation

The XRM mappings are compiled into CARML (RDF Mapping Language), which is a W3C standard based on R2RML.

### Generated CARML File

Location: `src-gen/mapping.carml.ttl`

Contains:
- Prefix declarations
- TriplesMap definitions
- Logical source definitions
- Subject maps
- Predicate-object maps

---

## Pipeline Processing

The pipeline is configured in `pipelines/main.ttl` and uses barnard59 to execute the CARML mapping.

### Pipeline Steps

1. **Read File**: Read the input JSON file
2. **CARML Service**: Apply the CARML mapping via the CARML service
3. **Serialize**: Convert to N-Triples format
4. **Write File**: Write the output to a file

### Running the Pipeline

```bash
npm install
npm run start
```

---

## Example Mappings

### Example 1: Simple Record

**Input JSON**:
```json
{
  "ID_NR": "12345",
  "SIGNATUR": "StABS A 1.1",
  "TITEL": "Verwaltungsakten"
}
```

**Generated RDF**:
```turtle
<https://ld.bs.ch/ais/Record/12345> a rico:RecordResource ;
  rdfs:seeAlso <https://dls.staatsarchiv.bs.ch/records/12345> ;
  rico:identifier "StABS A 1.1" ;
  rico:title "Verwaltungsakten"@ger .
```

### Example 2: Record with Hierarchy

**Generated RDF**:
```turtle
<https://ld.bs.ch/ais/Record/12345> a rico:RecordResource ;
  rico:isDirectlyIncludedIn <https://ld.bs.ch/ais/Record/1234> .

<https://ld.bs.ch/ais/Record/1234> a rico:RecordResource ;
  rico:directlyIncludes <https://ld.bs.ch/ais/Record/12345> .
```

### Example 3: Record with Dates

**Generated RDF**:
```turtle
<https://ld.bs.ch/ais/Record/12345> a rico:RecordResource ;
  rico:isAssociatedWithDate <https://ld.bs.ch/ais/Record/12345/Date> .

<https://ld.bs.ch/ais/Record/12345/Date> a rico:Date ;
  rico:isDateAssociatedWith <https://ld.bs.ch/ais/Record/12345> ;
  rico:expressedDate "1950-1960" ;
  rico:hasBeginningDate <https://ld.bs.ch/ais/1950-01-01> ;
  rico:hasEndDate <https://ld.bs.ch/ais/1960-12-31> .

<https://ld.bs.ch/ais/1950-01-01> a rico:Date ;
  rico:normalizedDateValue "1950-01-01"^^xsd:date ;
  rico:isBeginningDateOf <https://ld.bs.ch/ais/Record/12345/Date> .

<https://ld.bs.ch/ais/1960-12-31> a rico:Date ;
  rico:normalizedDateValue "1960-12-31"^^xsd:date ;
  rico:isEndDateOf <https://ld.bs.ch/ais/Record/12345/Date> .
```

---

## Field Reference

| JSON Field | RDF Property | Datatype/Language | Vocabulary | Notes |
|------------|--------------|-------------------|------------|-------|
| ID_NR | Subject URI | - | - | Primary identifier |
| SIGNATUR | rico:identifier | Literal | - | Record signature |
| TITEL | rico:title | Literal (@ger) | - | Record title |
| STUFE | rico:hasRecordSetType | IRI | stabs-rst: | Hierarchical level |
| PARENT_ID_NR | rico:isDirectlyIncludedIn | IRI | - | Parent record link |
| ENTSTEHUNGSZEITRAUM | rico:expressedDate | Literal | - | Creation period |
| created_start | rico:normalizedDateValue | xsd:date | - | Start date |
| created_end | rico:normalizedDateValue | xsd:date | - | End date |
| LAUFMETER | rico:quantity | xsd:decimal | - | Linear meters |
| ARCHIVALIENART | stabs-rico:hasOrHadArchivalType | IRI | stabs-art: | Archival type(s) |
| files_are_public | - | - | - | Access flag |
| STATUS_URHEBER_RECHT | rico:isAssociatedWithRule | IRI | stabs-crs: | Copyright status |
| PHYSISCHE_BESCHAFFENHEIT | rico:physicalCharacteristicsNote | Literal (@ger) | - | Physical condition |

---

## Mapping Statistics

- **Total Mapping Rules**: ~150
- **Logical Sources**: ~70
- **Vocabulary Terms**: ~100
- **URI Templates**: ~40
- **Output Properties**: ~50 unique properties

---

*See [DATAMODEL-OVERVIEW.md](./DATAMODEL-OVERVIEW.md) for the big picture*
*See [CLASS-DOCUMENTATION.md](./CLASS-DOCUMENTATION.md) for class details*
*See [PROPERTY-DOCUMENTATION.md](./PROPERTY-DOCUMENTATION.md) for property details*
*See [VOCABULARIES.md](./VOCABULARIES.md) for vocabulary terms*
*See [URI-PATTERNS.md](./URI-PATTERNS.md) for URI patterns*
