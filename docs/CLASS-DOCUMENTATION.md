# Class Documentation - Staatsarchiv Basel-Stadt Linked Data Model

This document provides detailed documentation for all classes used in the Staatsarchiv Basel-Stadt linked data model.

## Table of Contents

1. [RiC-O Core Classes](#rico-core-classes)
2. [StABS-Specific Classes](#stabs-specific-classes)
3. [External Ontology Classes](#external-ontology-classes)
4. [Class Hierarchy](#class-hierarchy)

---

## RiC-O Core Classes

### rico:RecordResource

**Description**: The primary class for archival records. Represents any archival entity that is being described.

**URI**: `https://www.ica.org/standards/RiC/ontology#RecordResource`

**Subclasses in StABS Model**:
- `rico:Record`
- `rico:RecordSet`
- `stabs-rico:RecordHGB`

**Key Properties**:
- `rico:identifier` - Unique identifier (e.g., signature)
- `rico:title` - Title of the record
- `rico:note` - General notes
- `rico:conditionsOfAccess` - Access conditions
- `rico:conditionsOfUse` - Use conditions
- `stabs-rico:contains` - Content description (Enthält)
- `stabs-rico:content` - Content description (Inhalt)
- `stabs-rico:includes` - Inclusion description (Darin)
- `stabs-rico:ort` - Place information
- `stabs-rico:person` - Person information
- `stabs-rico:extentNote` - Extent comments

**Usage in StABS**:
This is the base class for all Verzeichnungseinheiten (description units) in the archive. Every record in the StABS system is an instance of `rico:RecordResource` or one of its subclasses.

---

### rico:Record

**Description**: An individual record within a hierarchical structure.

**URI**: `https://www.ica.org/standards/RiC/ontology#Record`

**Superclass**: `rico:RecordResource`

**Usage in StABS**:
Represents individual documents (Dokument) at the leaf level of the archival hierarchy.

---

### rico:RecordSet

**Description**: A set of records with a common provenance, function, or other characteristic that justifies their grouping.

**URI**: `https://www.ica.org/standards/RiC/ontology#RecordSet`

**Superclass**: `rico:RecordResource`

**StABS-Specific Types** (via `rico:hasRecordSetType`):
- `stabs-rst:Archiv` - Top-level archive collection
- `stabs-rst:Abteilung` - Department
- `stabs-rst:Fonds` - Fonds (records from a provenance entity)
- `stabs-rst:Bestand` - Series/Group
- `stabs-rst:Serie` - File series
- `stabs-rst:Dossier` - File/Dossier
- `stabs-rst:BibRes` - Bibliographic resources

**Key Properties**:
- `rico:hasRecordSetType` - Type of record set
- `rico:history` - Administrative history (Archivgeschichte, Bestandsgeschichte, Verwaltungsgeschichte)
- `rico:hasOrHadOwner` - Owning organization
- `rico:isDirectlyIncludedIn` - Parent record set
- `rico:directlyIncludes` - Child record sets

---

### rico:Agent

**Description**: An entity (person, family, or corporate body) associated with archival records.

**URI**: `https://www.ica.org/standards/RiC/ontology#Agent`

**Subclasses**:
- `rico:Person`
- `rico:CorporateBody`
- `rico:Family`

**Usage in StABS**:
- Provenance entities (Aktenbildner)
- Principals (Auftraggeber)
- Descriptor entities in thesauri (Personenbegriffe)

**Key Properties**:
- `rico:name` - Name of the agent
- `rico:history` - Biographical/administrative history
- `rico:hasOrHadLocation` - Associated locations
- `rico:isOrganicOrFunctionalProvenanceOf` - Provenance relationship to records

---

### rico:Person

**Description**: An individual human being.

**URI**: `https://www.ica.org/standards/RiC/ontology#Person`

**Superclass**: `rico:Agent`

**Usage in StABS**:
Individuals associated with records, either as creators, subjects, or in other roles.

---

### rico:CorporateBody

**Description**: An organization or organized group of people.

**URI**: `https://www.ica.org/standards/RiC/ontology#CorporateBody`

**Superclass**: `rico:Agent`

**Usage in StABS**:
Government agencies, companies, and other organizational entities.

---

### rico:Place

**Description**: A geographic location.

**URI**: `https://www.ica.org/standards/RiC/ontology#Place`

**Usage in StABS**:
- Physical locations associated with records
- Descriptor entities in thesauri (Ortsbegriffe)

**Key Properties**:
- `rico:name` - Name of the place
- `rico:hasCoordinates` - Geographic coordinates

---

### rico:Date

**Description**: A temporal entity representing a point in time or a period.

**URI**: `https://www.ica.org/standards/RiC/ontology#Date`

**Usage in StABS**:
- Creation dates (ENTSTEHUNGSZEITRAUM)
- Start dates (created_start)
- End dates (created_end)

**Key Properties**:
- `rico:normalizedDateValue` - Machine-readable date (xsd:date)
- `rico:expressedDate` - Human-readable date expression
- `rico:isBeginningDateOf` - Beginning date relationship
- `rico:isEndDateOf` - End date relationship
- `rico:isDateAssociatedWith` - Association with records

---

### rico:Instantiation

**Description**: A physical or digital manifestation of a record.

**URI**: `https://www.ica.org/standards/RiC/ontology#Instantiation`

**Subclasses in StABS**:
- Digital instantiations (IIIF Manifests, File Collections)
- Analogue instantiations (Films, Videos)

**Key Properties**:
- `rico:isOrWasDigitalInstantiationOf` - Links to digital instantiation
- `rico:isOrWasAnalogueInstantiationOf` - Links to analogue instantiation
- `rico:hasCarrierType` - Physical carrier type
- `rico:hasRepresentationType` - Representation type
- `rico:identifier` - Instantiation identifier
- `rico:physicalCharacteristicsNote` - Physical characteristics

---

### rico:Identifier

**Description**: A unique identifier assigned to a record or other entity.

**URI**: `https://www.ica.org/standards/RiC/ontology#Identifier`

**Usage in StABS**:
- Old signatures (ALTE_SIGNATUREN)
- Previous signatures (FRUEHERE_SIGNATUR)
- Previous StABS signatures (FRUEHERE_STABS_SIGNATUR)

**Key Properties**:
- `rico:textualValue` - The identifier value
- `rico:hasIdentifierType` - Type of identifier (stabs-idt:)
- `rico:isOrWasIdentifierOf` - Entity being identified

---

### rico:Extent

**Description**: A measurement of the physical or logical size of a record.

**URI**: `https://www.ica.org/standards/RiC/ontology#Extent`

**Specialization in StABS**: `rico:RecordResourceExtent`

**Usage in StABS**:
- Linear meters (LAUFMETER)
- Number of units (ANZAHL)
- Number of files (ANZAHL_DATEIEN)
- Data volume in MB (DATENVOLUMEN_MB)
- Duration (ABSPIELDAUER)
- Approximate extent (UMFANG_GESCHAETZT)

**Key Properties**:
- `rico:quantity` - Numeric quantity
- `rico:hasExtentType` - Type of extent (stabs-ext:)
- `rico:hasUnitOfMeasurement` - Unit of measurement
- `rico:isExtentOf` - Record being measured

---

### rico:Rule

**Description**: A rule governing access, use, or other aspects of archival records.

**URI**: `https://www.ica.org/standards/RiC/ontology#Rule`

**Usage in StABS**:
- Access rules (stabs-acr:)
- Copyright rules (stabs-crs:)

**Key Properties**:
- `rico:isAssociatedWithRule` - Links records to rules

---

### rico:Activity

**Description**: An event or action that affects or is related to archival records.

**URI**: `https://www.ica.org/standards/RiC/ontology#Activity`

**Usage in StABS**:
- Ablieferungen (deliveries/transfers) - Not currently fully implemented

---

### rico:Type

**Description**: A classification or category.

**URI**: `https://www.ica.org/standards/RiC/ontology#Type`

**Usage in StABS**:
- Archival types (stabs-art:)
- Carrier types (stabs-crt:)
- Film types (stabs-fit:)
- Record set types (stabs-rst:)
- Representation types (stabs-rpt:)

---

## StABS-Specific Classes

### stabs-rico:RecordHGB

**Description**: A specialized record type for the Historical Ground Book (Historisches Grundbuch - HGB).

**URI**: `https://ld.bs.ch/ontologies/StABS-RiC/RecordHGB`

**Superclass**: `rico:RecordSet`, `rico:RecordResource`

**Restriction**: Must have `rico:hasRecordSetType` = `stabs-rst:Dossier`

**Usage**: Records that describe properties and ownership from the Historical Ground Book of Basel-Stadt.

**Specific Properties**:
- `stabs-rico:houseNameBS` - House name in Basel-Stadt
- `stabs-rico:oldHousenumber` - Old house number (per 1862)
- `stabs-rico:owner1862` - Property owner in 1862

---

## External Ontology Classes

### dcterms:BibliographicResource

**Description**: A bibliographic resource (from Dublin Core).

**URI**: `http://purl.org/dc/terms/BibliographicResource`

**Usage in StABS**:
Used in conjunction with `rico:RecordSet` and `rico:RecordResource` for bibliographic resources related to archival records.

---

### premis:Representation

**Description**: A representation of a digital object (from PREMIS).

**URI**: `http://www.loc.gov/premis/rdf/v3/Representation`

**Usage in StABS**:
Used alongside `rico:Instantiation` for digital instantiations to provide preservation metadata.

---

### premis:File

**Description**: A digital file (from PREMIS).

**URI**: `http://www.loc.gov/premis/rdf/v3/File`

**Usage in StABS**:
Represents individual files in file collections.

**Key Properties**:
- `premis:storedAt` - Storage location
- `rdfs:seeAlso` - Viewer URL

---

### premis:StorageLocation

**Description**: A storage location (from PREMIS).

**URI**: `http://www.loc.gov/premis/rdf/v3/StorageLocation`

**Usage in StABS**:
Public storage locations for digital files.

---

### ebucore:MediaResource

**Description**: A media resource (from EBU Core).

**URI**: `http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#MediaResource`

**Usage in StABS**:
Audiovisual media resources (films, videos).

---

### ebucoreplus:MediaResource

**Description**: Extended media resource (from EBU Core Plus).

**URI**: `http://www.ebu.ch/metadata/ontologies/ebucoreplus#MediaResource`

**Usage in StABS**:
Used alongside ebucore:MediaResource for additional properties.

---

### iiif:Manifest

**Description**: An IIIF Presentation Manifest.

**URI**: `http://iiif.io/api/presentation/3#Manifest`

**Usage in StABS**:
Represents IIIF manifests for digital images.

**Key Properties**:
- `rdfs:seeAlso` - Viewer URL
- `schema:url` - Manifest URL
- `rico:hasRepresentationType` - Type is `stabs-rpt:IiifType`

---

### skos:Concept

**Description**: A concept in a controlled vocabulary (from SKOS).

**URI**: `http://www.w3.org/2004/02/skos/core#Concept`

**Usage in StABS**:
- Thesaurus concepts (Personenbegriffe, Ortsbegriffe)
- Vocabulary terms

---

### skos:ConceptScheme

**Description**: A concept scheme (from SKOS).

**URI**: `http://www.w3.org/2004/02/skos/core#ConceptScheme`

**Usage in StABS**:
- All StABS vocabularies (stabs-rst:, stabs-art:, etc.)

---

## Class Hierarchy

```
rico:RecordResource
├── rico:Record
├── rico:RecordSet
│   └── stabs-rico:RecordHGB
└── (other RecordResource specializations)

rico:Agent
├── rico:Person
├── rico:CorporateBody
└── rico:Family

rico:Instantiation
├── (Digital Instantiations)
│   ├── iiiif:Manifest
│   └── premis:Representation
└── (Analogue Instantiations)
    ├── ebucore:MediaResource
    └── ebucoreplus:MediaResource

rico:Identifier
rico:Extent
├── rico:RecordResourceExtent
└── (other Extent types)

rico:Date
rico:Place
rico:Agent
rico:Rule
rico:Type
rico:Activity
```

---

## Class Summary Table

| Class | URI | Superclass | Description |
|-------|-----|------------|-------------|
| RecordResource | rico:RecordResource | - | Base class for all archival records |
| Record | rico:Record | RecordResource | Individual archival record |
| RecordSet | rico:RecordSet | RecordResource | Set of records with common characteristics |
| Agent | rico:Agent | - | Person, family, or corporate body |
| Person | rico:Person | Agent | Individual human being |
| CorporateBody | rico:CorporateBody | Agent | Organization or group |
| Place | rico:Place | - | Geographic location |
| Date | rico:Date | - | Temporal entity |
| Instantiation | rico:Instantiation | - | Physical or digital manifestation |
| Identifier | rico:Identifier | - | Unique identifier |
| Extent | rico:Extent | - | Size measurement |
| RecordResourceExtent | rico:RecordResourceExtent | Extent | Extent specific to record resources |
| Rule | rico:Rule | - | Governing rule |
| Type | rico:Type | - | Classification or category |
| Activity | rico:Activity | - | Event or action |
| RecordHGB | stabs-rico:RecordHGB | RecordSet, RecordResource | Historical Ground Book record |

---

*See [PROPERTY-DOCUMENTATION.md](./PROPERTY-DOCUMENTATION.md) for property details*
*See [VOCABULARIES.md](./VOCABULARIES.md) for vocabulary terms*
