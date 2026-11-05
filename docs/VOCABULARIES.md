# Vocabularies - Staatsarchiv Basel-Stadt Linked Data Model

This document provides detailed documentation for all controlled vocabularies used in the Staatsarchiv Basel-Stadt linked data model.

## Table of Contents

1. [Overview](#overview)
2. [Record Set Types (stabs-rst)](#record-set-types-stabs-rst)
3. [Archival Types (stabs-art)](#archival-types-stabs-art)
4. [Extent Types (stabs-ext)](#extent-types-stabs-ext)
5. [Carrier Types (stabs-crt)](#carrier-types-stabs-crt)
6. [Film Types (stabs-fit)](#film-types-stabs-fit)
7. [Identifier Types (stabs-idt)](#identifier-types-stabs-idt)
8. [Access Rules (stabs-acr)](#access-rules-stabs-acr)
9. [Copyright Status (stabs-crs)](#copyright-status-stabs-crs)
10. [Representation Types (stabs-rpt)](#representation-types-stabs-rpt)
11. [Thesaurus Types (stabs-tht)](#thesaurus-types-stabs-tht)

---

## Overview

The Staatsarchiv Basel-Stadt uses several controlled vocabularies to ensure consistency in describing archival materials. These vocabularies are implemented as SKOS concept schemes.

### Vocabulary Structure

Each vocabulary:
- Is a `skos:ConceptScheme`
- Contains `skos:Concept` instances as terms
- Has `skos:prefLabel` (preferred label) in German and sometimes English
- May have `skos:altLabel` (alternative labels)
- May have `skos:definition` (definitions)
- May have `skos:exactMatch` or `skos:closeMatch` to external vocabularies

### Namespace Prefixes

| Prefix | Namespace | Description |
|--------|-----------|-------------|
| `stabs-rst` | `https://ld.bs.ch/RiC/vocabularies/recordSetTypes/` | Record Set Types |
| `stabs-art` | `https://ld.bs.ch/RiC/vocabularies/archivalTypes/` | Archival Types |
| `stabs-ext` | `https://ld.bs.ch/RiC/vocabularies/extentTypes/` | Extent Types |
| `stabs-crt` | `https://ld.bs.ch/RiC/vocabularies/carrierTypes/` | Carrier Types |
| `stabs-fit` | `https://ld.bs.ch/RiC/vocabularies/filmTypes/` | Film Types |
| `stabs-idt` | `https://ld.bs.ch/RiC/vocabularies/identifierTypes/` | Identifier Types |
| `stabs-acr` | `https://ld.bs.ch/RiC/vocabularies/acRules/` | Access Rules |
| `stabs-crs` | `https://ld.bs.ch/RiC/vocabularies/crStatus/` | Copyright Status |
| `stabs-rpt` | `https://ld.bs.ch/RiC/vocabularies/representationTypes/` | Representation Types |
| `stabs-tht` | `https://ld.bs.ch/RiC/vocabularies/thesaurusTypes/` | Thesaurus Types |

---

## Record Set Types (stabs-rst)

**Namespace**: `https://ld.bs.ch/RiC/vocabularies/recordSetTypes/`

**Description**: Defines the hierarchical levels used in the Staatsarchiv Basel-Stadt for organizing archival materials.

| Term | URI | Pref Label (de) | Definition | RiC-O Type |
|------|-----|------------------|-----------|------------|
| Archiv | `stabs-rst:Archiv` | Archiv | Top-level collection representing the entire archive | `ric-rst:Collection` |
| Abteilung | `stabs-rst:Abteilung` | Abteilung | Department - internal coarse grouping | `ric-rst:Collection` |
| Fonds | `stabs-rst:Fonds` | Fonds | Fonds - all records from a provenance entity | `ric-rst:Fonds` |
| Bestand | `stabs-rst:Bestand` | Bestand | Series/Group - subdivision of Fonds | `ric-rst:Series` |
| Serie | `stabs-rst:Serie` | Serie | Series - hierarchical subdivision within Bestand | `ric-rst:Series` |
| Dossier | `stabs-rst:Dossier` | Dossier | File/Dossier - physically distinct unit | `ric-rst:File` |
| BibRes | `stabs-rst:BibRes` | Bibliografische Ressourcen | Bibliographic resources related to records | `ric-rst:Collection` |

**Hierarchy**: Archiv → Abteilung → Fonds → Bestand → Serie → Dossier

**Property used**: `rico:hasRecordSetType`

---

## Archival Types (stabs-art)

**Namespace**: `https://ld.bs.ch/RiC/vocabularies/archivalTypes/`

**Description**: Classifies the nature or form of archival materials.

| Code | URI | Pref Label (de) | Pref Label (en) | Wikidata Match | Notes |
|------|-----|------------------|------------------|----------------|-------|
| 10001 | `stabs-art:10001` | Akte | - | `wd:Q59221146` | Most common type |
| 10002 | `stabs-art:10002` | Urkunde | - | `wd:Q196756` | Legal documents |
| 10003 | `stabs-art:10003` | Bild | - | `wd:Q478798` | Visual materials |
| 10004 | `stabs-art:10004` | Plan | - | `wd:Q4006`, `gnd:4029783-4` | Architectural, engineering |
| 10005 | `stabs-art:10005` | Bewegtbild (Film) | - | `wd:Q11424` | Cinematic materials |
| 10006 | `stabs-art:10006` | Tonaufzeichnung | - | `wd:Q3302947` | Sound recordings |
| 10007 | `stabs-art:10007` | Drucksache | printed matter | `wd:Q1261026` | Published materials |
| 10099 | `stabs-art:10099` | Mikroform | - | `wd:Q830450`, `gnd:4039216-8` | Microfilm, microfiche |
| 10101 | `stabs-art:10101` | Objekt | - | `wd:Q337060` | Three-dimensional objects |
| 10188 | `stabs-art:10188` | Digitales Speichermedium | - | `wd:Q66221` | Digital carriers |
| 13152 | `stabs-art:13152` | Plakat | poster | `gnd:4046198-1`, `wd:Q429785` | Large-format prints |
| 13161 | `stabs-art:13161` | Datei | computer file | `wd:Q82753` | Digital files |
| 13162 | `stabs-art:13162` | Netzressource | web resource | `wd:Q3427877` | Online resources |

**Property used**: `stabs-rico:hasOrHadArchivalType`

**JSON Path**: `ARCHIVALIENART` (array of strings)

---

## Extent Types (stabs-ext)

**Namespace**: `https://ld.bs.ch/RiC/vocabularies/extentTypes/`

**Description**: Types of extent measurements for archival materials.

| Term | URI | Pref Label (de) | Definition | Unit | Notes |
|------|-----|------------------|-----------|------|-------|
| Laufmeter | `stabs-ext:Laufmeter` | Laufmeter | Linear measurement in meters | `unit:M` | Physical shelf space |
| Anzahl | `stabs-ext:Anzahl` | Anzahl | Number/Count | - | Number of units |
| Anzahl_Dateien | `stabs-ext:Anzahl_Dateien` | Anzahl-Dateien | Number of Files | - | Digital file count |
| Datenvolumen_MB | `stabs-ext:Datenvolumen_MB` | Datenvolumen-MB | Data Volume in MB | - | Digital storage size |
| Dauer | `stabs-ext:Dauer` | Dauer | Duration | `quantity:Time` | Playback time, etc. |
| Umfang_approximativ | `stabs-ext:Umfang_approximativ` | Umfang-approximativ | Approximate Extent | - | Estimated extent |

**Property used**: `rico:hasExtentType`

**JSON Paths**: LAUFMETER, ANZAHL, ANZAHL_DATEIEN, DATENVOLUMEN_MB, ABSPIELDAUER, UMFANG_GESCHAETZT

---

## Carrier Types (stabs-crt)

**Namespace**: `https://ld.bs.ch/RiC/vocabularies/carrierTypes/`

**Description**: Types of film carrier materials.

| Code | URI | Pref Label | Definition | Notes |
|------|-----|-------------|-----------|-------|
| 13029 | `stabs-crt:13029` | 13029 | Cellulose nitrate | Early film stock, highly flammable |
| 13030 | `stabs-crt:13030` | 13030 | Cellulose acetate | Safety film, replaced nitrate |
| 13031 | `stabs-crt:13031` | 13031 | Polyester | Modern, stable film stock |
| 13042 | `stabs-crt:13042` | 13042 | Acetate | Acetate film |
| 13043 | `stabs-crt:13043` | 13043 | Nitrate | Nitrate film |

**Property used**: `rico:hasCarrierType`

**JSON Path**: `TRAEGERMATERIAL`

---

## Film Types (stabs-fit)

**Namespace**: `https://ld.bs.ch/RiC/vocabularies/filmTypes/`

**Description**: Types of film elements (Filmelement).

| Code | URI | Pref Label (de) | Definition | Notes |
|------|-----|------------------|-----------|-------|
| 13018 | `stabs-fit:13018` | 13018 | Vorführkopie | Release print |
| 13019 | `stabs-fit:13019` | 13019 | Umkehroriginal (Positiv) | Reversal original (positive) |
| 13020 | `stabs-fit:13020` | 13020 | A/B-Rollen (Negative) | A/B rolls (negative) |
| 13021 | `stabs-fit:13021` | 13021 | Internegativ | Internegative |
| 13022 | `stabs-fit:13022` | 13022 | Interpositiv | Intermediate positive |
| 13023 | `stabs-fit:13023` | 13023 | Dub-Negativ | Duplicate negative |
| 13024 | `stabs-fit:13024` | 13024 | Dub-Positiv | Duplicate positive |
| 13025 | `stabs-fit:13025` | 13025 | Intermedpositiv | Intermediate positive |
| 13026 | `stabs-fit:13026` | 13026 | Arbeitskopie | Work copy |
| 13027 | `stabs-fit:13027` | 13027 | Nullkopie | Zero copy |
| 13028 | `stabs-fit:13028` | 13028 | CRI | Color Reversal Intermediate |
| 13044 | `stabs-fit:13044` | 13044 | Positiv | Positive |
| 13045 | `stabs-fit:13045` | 13045 | Umkehrpositiv | Reversal positive |
| 13046 | `stabs-fit:13046` | 13046 | Negativ | Negative |
| 13047 | `stabs-fit:13047` | 13047 | Umkehrnegativ | Reversal negative |
| 13050 | `stabs-fit:13050` | 13050 | Positivkopie von einem 35mm-Film | Positive copy from 35mm film |
| 13051 | `stabs-fit:13051` | 13051 | IntermediatePositiv | Intermediate positive |
| 13052 | `stabs-fit:13052` | 13052 | Positivkopie | Positive copy |
| 13053 | `stabs-fit:13053` | 13053 | Umkehrpositiv (kurzer Teil in der Mitte Positiv) | Reversal positive (short middle part positive) |
| 13054 | `stabs-fit:13054` | 13054 | Verschiedene | Various |
| 13055 | `stabs-fit:13055` | 13055 | Umkehrpositiv (nicht ganz sicher) | Reversal positive (not quite certain) |
| 13056 | `stabs-fit:13056` | 13056 | Original Tonpositiv | Original sound positive |
| 13057 | `stabs-fit:13057` | 13057 | Positiv (Kopie) | Positive (copy) |

**Property used**: `stabs-rico:hasFilmType`

**JSON Path**: `FILMELEMENT`

---

## Identifier Types (stabs-idt)

**Namespace**: `https://ld.bs.ch/RiC/vocabularies/identifierTypes/`

**Description**: Types of identifiers for archival records.

| Term | URI | Pref Label (de) | Pref Label (en) | Definition | Notes |
|------|-----|------------------|------------------|-----------|-------|
| Alte_Signatur | `stabs-idt:Alte_Signatur` | Alte-Signatur | - | Old Signature | Previous signature from another system |
| Fruehere_Signatur | `stabs-idt:Fruehere_Signatur` | Fruehere-Signatur | - | Previous Signature | Previous signature |
| Fruehere_StABS_Signatur | `stabs-idt:Fruehere_StABS_Signatur` | Fruehere-StABS-Signatur | - | Previous StABS Signature | Previous signature within StABS |

**Property used**: `rico:hasIdentifierType`

**JSON Paths**: ALTE_SIGNATUREN, FRUEHERE_SIGNATUR, FRUEHERE_STABS_SIGNATUR

---

## Access Rules (stabs-acr)

**Namespace**: `https://ld.bs.ch/RiC/vocabularies/acRules/`

**Description**: Access rules governing who can access archival materials and under what conditions.

| Term | URI | Pref Label | Definition | Criteria |
|------|-----|-------------|-----------|----------|
| freeonline | `stabs-acr:freeonline` | free-online | Freely available online | `files_are_public == true` AND `STATUS_URHEBER_RECHT` matches `/^Gemeinfrei\|^Staatsarchiv/` |
| orderablerr | `stabs-acr:orderablerr` | orderable-readingroom | Orderable for reading room access | `is_approval_required == false` AND `is_orderable_for_inspection == true` |
| orderablerp | `stabs-acr:orderablerp` | orderable-reproduction | Orderable for reproduction | `is_approval_required == false` AND `is_orderable_for_reproduction == true` |
| protected | `stabs-acr:protected` | protected | Protected access | `is_approval_required == true` AND (`is_orderable_for_inspection == true` OR `is_orderable_for_reproduction == true`) |

**Property used**: `rico:isAssociatedWithRule`

---

## Copyright Status (stabs-crs)

**Namespace**: `https://ld.bs.ch/RiC/vocabularies/crStatus/`

**Description**: Copyright status of archival materials.

| Term | URI | Pref Label | Definition | Criteria |
|------|-----|-------------|-----------|----------|
| pd | `stabs-crs:pd` | public-domain | Public Domain | `STATUS_URHEBER_RECHT` matches `/^Gemeinfrei/` |
| sa | `stabs-crs:sa` | state-archives-bs | State Archives Basel-Stadt | `STATUS_URHEBER_RECHT` matches `/^Staatsarchiv/` |
| un | `stabs-crs:un` | unknown | Unknown | `STATUS_URHEBER_RECHT` matches `/^Ungeklärt/` |
| cr | `stabs-crs:cr` | creator | Creator | `STATUS_URHEBER_RECHT` matches `/^VerfertigerIn/` |
| or | `stabs-crs:or` | orphaned | Orphaned Work | `STATUS_URHEBER_RECHT` matches `/^Verwaist/` |

**Property used**: `rico:isAssociatedWithRule`

---

## Representation Types (stabs-rpt)

**Namespace**: `https://ld.bs.ch/RiC/vocabularies/representationTypes/`

**Description**: Types of digital representations.

| Term | URI | Pref Label | Definition | Notes |
|------|-----|-------------|-----------|-------|
| IiifType | `stabs-rpt:IiifType` | IiifType | IIIF Presentation Manifest | For image-based resources |
| FcType | `stabs-rpt:FcType` | FcType | File Collection | For collections of files (PDF, audio, video, etc.) |

**Property used**: `rico:hasRepresentationType`

---

## Thesaurus Types (stabs-tht)

**Namespace**: `https://ld.bs.ch/RiC/vocabularies/thesaurusTypes/`

**Description**: Types of thesauri used for subject indexing.

| Term | URI | Pref Label (de) | Pref Label (en) | Definition | Notes |
|------|-----|------------------|------------------|-----------|-------|
| Personenbegriffe | `stabs-tht:Personenbegriffe` | Personenbegriffe | - | Person Concepts | Thesaurus for person names |
| Ortsbegriffe | `stabs-tht:Ortsbegriffe` | Ortsbegriffe | - | Place Concepts | Thesaurus for place names |

**Property used**: `skos:inScheme`

---

## Vocabulary Summary Table

| Vocabulary | Prefix | # Terms | Purpose | Property Used |
|------------|--------|---------|---------|---------------|
| Record Set Types | stabs-rst | 7 | Hierarchical levels | `rico:hasRecordSetType` |
| Archival Types | stabs-art | 14 | Material types | `stabs-rico:hasOrHadArchivalType` |
| Extent Types | stabs-ext | 6 | Size measurements | `rico:hasExtentType` |
| Carrier Types | stabs-crt | 5 | Film carrier materials | `rico:hasCarrierType` |
| Film Types | stabs-fit | 25+ | Film element types | `stabs-rico:hasFilmType` |
| Identifier Types | stabs-idt | 3 | Identifier classifications | `rico:hasIdentifierType` |
| Access Rules | stabs-acr | 4 | Access conditions | `rico:isAssociatedWithRule` |
| Copyright Status | stabs-crs | 5 | Copyright conditions | `rico:isAssociatedWithRule` |
| Representation Types | stabs-rpt | 2 | Digital representation types | `rico:hasRepresentationType` |
| Thesaurus Types | stabs-tht | 2 | Subject thesauri | `skos:inScheme` |

---

*See [DATAMODEL-OVERVIEW.md](./DATAMODEL-OVERVIEW.md) for the big picture*
*See [CLASS-DOCUMENTATION.md](./CLASS-DOCUMENTATION.md) for class details*
*See [PROPERTY-DOCUMENTATION.md](./PROPERTY-DOCUMENTATION.md) for property details*
