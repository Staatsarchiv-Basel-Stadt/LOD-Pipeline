# Property Documentation - Staatsarchiv Basel-Stadt Linked Data Model

This document provides detailed documentation for all properties used in the Staatsarchiv Basel-Stadt linked data model.

## Table of Contents

1. [RiC-O Core Properties](#rico-core-properties)
2. [StABS-Specific Properties](#stabs-specific-properties)
3. [External Ontology Properties](#external-ontology-properties)
4. [Property Index](#property-index)

---

## RiC-O Core Properties

### Object Properties

#### rico:isDirectlyIncludedIn

**URI**: `https://www.ica.org/standards/RiC/ontology#isDirectlyIncludedIn`

**Domain**: `rico:RecordResource`

**Range**: `rico:RecordResource`

**Description**: Indicates that the subject Record Resource is directly included in the object Record Resource.

**Inverse**: `rico:directlyIncludes`

**Usage in StABS**: Links child records to their immediate parent in the hierarchy.

---

#### rico:directlyIncludes

**URI**: `https://www.ica.org/standards/RiC/ontology#directlyIncludes`

**Domain**: `rico:RecordResource`

**Range**: `rico:RecordResource`

**Description**: Indicates that the subject Record Resource directly includes the object Record Resource.

**Inverse**: `rico:isDirectlyIncludedIn`

**Usage in StABS**: Links parent records to their immediate children.

---

#### rico:hasRecordSetType

**URI**: `https://www.ica.org/standards/RiC/ontology#hasRecordSetType`

**Domain**: `rico:RecordSet`

**Range**: `rico:RecordSetType`

**Description**: Specifies the type of a Record Set.

**Usage in StABS**: Values from `stabs-rst:` vocabulary.

---

#### rico:hasOrHadOwner

**URI**: `https://www.ica.org/standards/RiC/ontology#hasOrHadOwner`

**Domain**: `rico:RecordResource`

**Range**: `rico:Agent`

**Description**: Indicates the owner of the Record Resource.

**Usage in StABS**: Typically `https://ld.bs.ch/org/staatsarchiv`.

---

#### rico:isAssociatedWithDate

**URI**: `https://www.ica.org/standards/RiC/ontology#isAssociatedWithDate`

**Domain**: `rico:RecordResource`

**Range**: `rico:Date`

**Description**: Links a record to an associated date.

---

#### rico:isAssociatedWithRule

**URI**: `https://www.ica.org/standards/RiC/ontology#isAssociatedWithRule`

**Domain**: `rico:RecordResource`

**Range**: `rico:Rule`

**Description**: Links a record to an access or use rule.

**Usage in StABS**: Values from `stabs-acr:` (access rules) and `stabs-crs:` (copyright status).

---

#### rico:hasOrHadIdentifier

**URI**: `https://www.ica.org/standards/RiC/ontology#hasOrHadIdentifier`

**Domain**: `rico:RecordResource`

**Range**: `rico:Identifier`

**Description**: Links a record to an identifier.

---

#### rico:hasExtent

**URI**: `https://www.ica.org/standards/RiC/ontology#hasExtent`

**Domain**: `rico:RecordResource`

**Range**: `rico:Extent`

**Description**: Links a record to its extent measurement.

---

#### rico:hasOrHadDigitalInstantiation

**URI**: `https://www.ica.org/standards/RiC/ontology#hasOrHadDigitalInstantiation`

**Domain**: `rico:RecordResource`

**Range**: `rico:Instantiation`

**Description**: Links a record to its digital instantiation.

---

#### rico:hasOrHadAnalogueInstantiation

**URI**: `https://www.ica.org/standards/RiC/ontology#hasOrHadAnalogueInstantiation`

**Domain**: `rico:RecordResource`

**Range**: `rico:Instantiation`

**Description**: Links a record to its analogue instantiation.

---

#### rico:isOrWasDigitalInstantiationOf

**URI**: `https://www.ica.org/standards/RiC/ontology#isOrWasDigitalInstantiationOf`

**Domain**: `rico:Instantiation`

**Range**: `rico:RecordResource`

**Description**: Links a digital instantiation to the record it instantiates.

---

#### rico:hasCarrierType

**URI**: `https://www.ica.org/standards/RiC/ontology#hasCarrierType`

**Domain**: `rico:Instantiation`

**Range**: `rico:Type`

**Description**: Specifies the carrier type of an instantiation.

**Usage in StABS**: Values from `stabs-crt:` or `rdact:` (RDA Carrier Types).

---

#### rico:hasRepresentationType

**URI**: `https://www.ica.org/standards/RiC/ontology#hasRepresentationType`

**Domain**: `rico:Instantiation`

**Range**: `rico:Type`

**Description**: Specifies the representation type.

**Usage in StABS**: Values from `stabs-rpt:`.

---

#### rico:hasOrHadType

**URI**: `https://www.ica.org/standards/RiC/ontology#hasOrHadType`

**Domain**: `rico:RecordResource`, `rico:Instantiation`, etc.

**Range**: `rico:Type`

**Description**: Links an entity to its type.

---

### Datatype Properties

#### rico:identifier

**URI**: `https://www.ica.org/standards/RiC/ontology#identifier`

**Domain**: `rico:RecordResource`, `rico:Instantiation`, etc.

**Range**: `rdfs:Literal`

**Description**: A unique identifier for the entity.

**Usage in StABS**: SIGNATUR (signature) for records.

---

#### rico:title

**URI**: `https://www.ica.org/standards/RiC/ontology#title`

**Domain**: `rico:RecordResource`, `rico:Agent`, `rico:Place`, etc.

**Range**: `rdfs:Literal`

**Description**: A title or name for the entity.

**Usage in StABS**: TITEL field from JSON, language-tagged as German.

---

#### rico:note

**URI**: `https://www.ica.org/standards/RiC/ontology#note`

**Domain**: `rico:RecordResource`, `rico:Agent`, etc.

**Range**: `rdfs:Literal`

**Description**: A general note about the entity.

**Usage in StABS**: ANMERKUNGEN (annotations).

---

#### rico:conditionsOfAccess

**URI**: `https://www.ica.org/standards/RiC/ontology#conditionsOfAccess`

**Domain**: `rico:RecordResource`

**Range**: `rdfs:Literal`

**Description**: Conditions governing access to the record.

**Usage in StABS**: ZUGANGSBESTIMMUNGEN field, language-tagged as German.

---

#### rico:conditionsOfUse

**URI**: `https://www.ica.org/standards/RiC/ontology#conditionsOfUse`

**Domain**: `rico:RecordResource`

**Range**: `rdfs:Literal`

**Description**: Conditions governing use of the record.

**Usage in StABS**: ZUGAENGLICHKEIT_NM field, language-tagged as German.

---

#### rico:history

**URI**: `https://www.ica.org/standards/RiC/ontology#history`

**Domain**: `rico:RecordSet`, `rico:Agent`

**Range**: `rdfs:Literal`

**Description**: Administrative or biographical history.

**Usage in StABS**: ARCHIVGESCHICHTE, BESTANDSGESCHICHTE, VERWALTUNGSGESCHICHTE_BIOGRAFI.

---

#### rico:textualValue

**URI**: `https://www.ica.org/standards/RiC/ontology#textualValue`

**Domain**: `rico:Identifier`

**Range**: `rdfs:Literal`

**Description**: The textual value of an identifier.

---

#### rico:quantity

**URI**: `https://www.ica.org/standards/RiC/ontology#quantity`

**Domain**: `rico:Extent`

**Range**: `rdfs:Literal` (typed as xsd:decimal, xsd:integer, xsd:string)

**Description**: The numeric quantity of the extent.

---

#### rico:normalizedDateValue

**URI**: `https://www.ica.org/standards/RiC/ontology#normalizedDateValue`

**Domain**: `rico:Date`

**Range**: `rdfs:Literal` (typed as xsd:date)

**Description**: Machine-readable normalized date value.

---

#### rico:expressedDate

**URI**: `https://www.ica.org/standards/RiC/ontology#expressedDate`

**Domain**: `rico:Date`

**Range**: `rdfs:Literal`

**Description**: Human-readable date expression.

---

#### rico:physicalCharacteristicsNote

**URI**: `https://www.ica.org/standards/RiC/ontology#physicalCharacteristicsNote`

**Domain**: `rico:Instantiation`

**Range**: `rdfs:Literal`

**Description**: Notes about physical characteristics.

**Usage in StABS**: PHYSISCHE_BESCHAFFENHEIT (physical condition).

---

## StABS-Specific Properties

### stabs-rico:contains

**URI**: `https://ld.bs.ch/ontologies/StABS-RiC/contains`

**Domain**: `rico:RecordResource`

**Range**: `rdfs:Literal`

**Description**: Content description - "Enthält" (Contains). Used to describe the content of a record when the title is general or when records are described summarily.

**Subproperty of**: `rico:scopeAndContent`

**Usage in StABS**: Maps to ENTHAELT field, language-tagged as German.

---

### stabs-rico:content

**URI**: `https://ld.bs.ch/ontologies/StABS-RiC/content`

**Domain**: `rico:RecordResource`

**Range**: `rdfs:Literal`

**Description**: Content description - "Inhalt" (Content). Used to provide a brief description of the content of images, plans, and audiovisual media.

**Subproperty of**: `rico:scopeAndContent`

**Usage in StABS**: Maps to INHALT field, language-tagged as German.

---

### stabs-rico:includes

**URI**: `https://ld.bs.ch/ontologies/StABS-RiC/includes`

**Domain**: `rico:RecordResource`

**Range**: `rdfs:Literal`

**Description**: Inclusion description - "Darin" (Therein/Included). Used to note contents of a record that cannot be expected from the title, or to highlight particularly important or unusual materials.

**Subproperty of**: `rico:scopeAndContent`

**Usage in StABS**: Maps to DARIN field, language-tagged as German.

---

### stabs-rico:extentNote

**URI**: `https://ld.bs.ch/ontologies/StABS-RiC/extentNote`

**Domain**: `rico:RecordResource`, `rico:Instantiation`

**Range**: `rdfs:Literal`

**Description**: Comment on extent - "Kommentar zum Umfang". Used to provide additional notes about extent measurements.

**Subproperty of**: `rico:note`

**Usage in StABS**: Maps to KOMMENTAR_ZUM_UMFANG field, language-tagged as German.

---

### stabs-rico:ort

**URI**: `https://ld.bs.ch/ontologies/StABS-RiC/ort`

**Domain**: `rico:RecordResource`

**Range**: `rdfs:Literal`

**Description**: Place - "Ort". Used for place information directly associated with a record when there is no separate place entity.

**Note**: Should eventually be replaced with proper `rico:Place` entities.

**Usage in StABS**: Maps to ORT field, language-tagged as German.

---

### stabs-rico:person

**URI**: `https://ld.bs.ch/ontologies/StABS-RiC/person`

**Domain**: `rico:RecordResource`

**Range**: `rdfs:Literal`

**Description**: Person - "Person". Used for person information directly associated with a record when there is no separate person entity.

**Note**: Should eventually be replaced with proper `rico:Person` entities.

**Usage in StABS**: Maps to PERSON field, language-tagged as German.

---

### stabs-rico:houseNameBS

**URI**: `https://ld.bs.ch/ontologies/StABS-RiC/houseNameBS`

**Domain**: `stabs-rico:RecordHGB`

**Range**: `rdfs:Literal`

**Description**: House name in Basel-Stadt.

**Usage in StABS**: Maps to HAUSNAME field, language-tagged as German.

---

### stabs-rico:oldHousenumber

**URI**: `https://ld.bs.ch/ontologies/StABS-RiC/oldHousenumber`

**Domain**: `stabs-rico:RecordHGB`

**Range**: `rdfs:Literal`

**Description**: Old house number (per 1862).

**Usage in StABS**: Maps to ALTE_HAUSNUMMER field, language-tagged as German.

---

### stabs-rico:owner1862

**URI**: `https://ld.bs.ch/ontologies/StABS-RiC/owner1862`

**Domain**: `stabs-rico:RecordHGB`

**Range**: `rdfs:Literal`

**Description**: Property owner in 1862.

**Usage in StABS**: Maps to EIGENTUEMER_1862 field, language-tagged as German.

---

### stabs-rico:hasFilmType

**URI**: `https://ld.bs.ch/ontologies/StABS-RiC/hasFilmType`

**Domain**: `rico:Instantiation`

**Range**: `stabs-fit:`

**Description**: Links a film instantiation to its film type.

**Subproperty of**: `rico:hasOrHadType`

**Inverse**: `stabs-rico:isFilmTypeOf`

**Usage in StABS**: Maps to FILMELEMENT field, values from `stabs-fit:` vocabulary.

---

### stabs-rico:hasOrHadArchivalType

**URI**: `https://ld.bs.ch/ontologies/StABS-RiC/hasOrHadArchivalType`

**Domain**: `rico:RecordResource`

**Range**: `stabs-art:`

**Description**: Links a record resource to its archival type(s).

**Subproperty of**: `rico:hasOrHadType`

**Inverse**: `stabs-rico:isOrWasArchivalTypeOf`

**Usage in StABS**: Maps to ARCHIVALIENART field, values from `stabs-art:` vocabulary.

---

## External Ontology Properties

### dcterms:bibliographicCitation

**URI**: `http://purl.org/dc/terms/bibliographicCitation`

**Domain**: `dcterms:BibliographicResource`

**Range**: `rdfs:Literal`

**Description**: Bibliographic citation for the resource.

**Usage in StABS**: LITERATUR_BEST_INSG, VEROEFFENTLICHUNGEN.

---

### schema:url

**URI**: `http://schema.org/url`

**Domain**: `iiif:Manifest`

**Range**: `rdfs:Literal` (xsd:anyURI)

**Description**: URL of the IIIF manifest.

---

### rdfs:seeAlso

**URI**: `http://www.w3.org/2000/01/rdf-schema#seeAlso`

**Domain**: Any

**Range**: `rdf:Resource`

**Description**: Indicates a resource that might provide additional information.

**Usage in StABS**: Links to DLS records, viewer URLs.

---

### skos Properties

- **skos:prefLabel** - Preferred label for a concept
- **skos:altLabel** - Alternative label for a concept
- **skos:note** - General note about a concept
- **skos:definition** - Definition of a concept
- **skos:related** - Links related concepts
- **skos:inScheme** - Links a concept to its concept scheme
- **skos:topConceptOf** - Indicates a top concept in a scheme

---

### premis Properties

- **premis:storedAt** - Links a file to its storage location
- **premis:medium** - Medium/type of storage
- **premis:hasFormat** - Format of the representation

---

### ebucore Properties

- **ebucore:hasFormat** - Format of the media resource
- **ebucore:hasVideoCodec** - Video codec used
- **ebucore:hasColourSpace** - Color space information
- **ebucore:aspectRatio** - Aspect ratio of the media
- **ebucoreplus:hasFormat**, **ebucoreplus:hasVideoCodec**, **ebucoreplus:hasColourSpace**, **ebucoreplus:aspectRatio** - EBU Core Plus extensions

---

### relSubType Properties

- **relSubType:isp** - "is part of" relationship
- **relSubType:hsp** - "has part" relationship

---

## Property Index

### By Domain

#### rico:RecordResource
- `rico:identifier`
- `rico:title`
- `rico:note`
- `rico:conditionsOfAccess`
- `rico:conditionsOfUse`
- `rico:isDirectlyIncludedIn`
- `rico:directlyIncludes`
- `rico:hasRecordSetType`
- `rico:hasOrHadOwner`
- `rico:isAssociatedWithDate`
- `rico:isAssociatedWithRule`
- `rico:hasOrHadIdentifier`
- `rico:hasExtent`
- `rico:hasOrHadDigitalInstantiation`
- `rico:hasOrHadAnalogueInstantiation`
- `stabs-rico:contains`
- `stabs-rico:content`
- `stabs-rico:includes`
- `stabs-rico:extentNote`
- `stabs-rico:ort`
- `stabs-rico:person`
- `stabs-rico:hasOrHadArchivalType`

#### rico:Instantiation
- `rico:isOrWasDigitalInstantiationOf`
- `rico:isOrWasAnalogueInstantiationOf`
- `rico:hasCarrierType`
- `rico:hasRepresentationType`
- `rico:identifier`
- `rico:physicalCharacteristicsNote`
- `stabs-rico:hasFilmType`

---

*See [CLASS-DOCUMENTATION.md](./CLASS-DOCUMENTATION.md) for class details*
*See [VOCABULARIES.md](./VOCABULARIES.md) for vocabulary terms*
