### Scope

This Implementation Guide specifies FHIR R4 access requirements for imaging reports through the European Health Access API. It describes document-based and resource-based access, the actors involved, and the capability statements that define their expected behavior.

The guide includes imaging-report-specific API artifacts, including the MHD DocumentReference profile, search parameters, and provider and consumer capability statements.

### Relationship to the Imaging Report Guide

The [EU Imaging Study Report R4 guide](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/) defines the report content and clinical resources. This guide defines how those reports are exposed and accessed through the Health Access API. It complements the report-content guide and does not define a separate R5 API implementation.

### Health Access API

The API builds on the actors and exchange patterns defined by {{EuridiceHealthDataAPI}}. The [Health Access API for Imaging Reports](api.html) page describes document access, resource access, and the associated capability statements.
