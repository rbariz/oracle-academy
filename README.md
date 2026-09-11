# Oracle Academy

Oracle Academy is a training management application built with Oracle APEX, PL/SQL and Oracle REST Data Services (ORDS).

The project is designed as a practical reference for building, exposing and deploying an Oracle application using a database-centric business core, thin APEX pages and a secured REST API.

## Architecture

The application follows these principles:

- Oracle Database owns persistence and core business rules.
- PL/SQL packages implement business operations.
- Views provide reusable read models.
- Oracle APEX provides the user interface and orchestration layer.
- ORDS exposes selected business data through REST APIs.
- OAuth protects REST resources.
- Deployment artifacts are versioned independently from environment-specific configuration.

High-level architecture:

```text
Users
  |
  v
Oracle APEX
  |
  +----------------------+
  |                      |
  v                      v
Read Models          PL/SQL APIs
  |                      |
  +----------+-----------+
             |
             v
        Oracle Database
             |
             v
            ORDS
             |
             v
          REST API
		  
Main Functional Areas

The application currently includes:

Course catalog
Training sessions
Session calendar
Trainers
Participants
Enrollments
Attendance
Assessments
Certifications
Session deletion governed by business eligibility rules
Database Model

The core business tables are:

COURSE
TRAINER
TRAINING_SESSION
SESSION_TRAINER
SESSION_MEETING
PARTICIPANT
ENROLLMENT
ATTENDANCE
ASSESSMENT
CERTIFICATION

Reusable read models include:

VW_COURSE_CATALOG
VW_SESSION_CALENDAR
VW_ENROLLMENT_PROGRESS
VW_SESSION_OVERVIEW
VW_CERTIFICATION_HISTORY
Business APIs

Important PL/SQL packages include:

ACADEMY_SESSION_API
ACADEMY_UI
ACADEMY_NUMBER_STEPPER_PLUGIN

The application uses native APEX DML for simple CRUD operations and PL/SQL APIs for operations containing business rules.

REST API

ORDS exposes the versioned API under:

/api/v1/

Example resource:

GET /sessions/
GET /sessions/:id

REST access is protected using ORDS roles, privileges and OAuth.

Environment-specific ORDS schema aliases are deliberately not embedded in the portable REST artifact.

Repository Structure
oracle-academy/
├── apex/
│   └── f102/
├── database/
│   ├── ddl/
│   ├── indexes/
│   ├── packages/
│   ├── seed/
│   ├── triggers/
│   ├── views/
│   └── install.sql
├── deployment/
├── docs/
├── ords/
│   └── api-v1/
├── .gitignore
└── README.md
Database Deployment

The database installation driver is:

database/install.sql

It installs objects in dependency order:

Tables
  ↓
Explicit indexes
  ↓
Views
  ↓
Package specifications
  ↓
Package bodies
  ↓
Triggers
  ↓
Seed data

The target schema requires the appropriate Oracle privileges and tablespace quota.

The application deployment artifacts do not provision database users or store passwords.

APEX Deployment

The repository contains a deterministic split APEX export generated without export timestamps.

The generated APEX export remains immutable.

Target-specific values such as:

workspace
application ID
parsing schema

should be supplied externally through APEX_APPLICATION_INSTALL.

A release-test deployment should use a different application ID from the development application.

ORDS Deployment

The ORDS artifact contains:

REST module
templates
handlers
role
privilege

ORDS schema enablement and URL mapping are treated as environment configuration and are therefore kept outside the portable API artifact.

Deployment Validation

The release baseline has been validated using a fresh deployment schema.

Validation included:

full database reconstruction
seed loading
object compilation
APEX deployment under an isolated application ID
APEX UI smoke tests
ORDS deployment
anonymous REST security test
OAuth authenticated REST test
Source Control Strategy

main represents a stable and deployable state.

Changes should be developed in short-lived branches and merged after validation.

Commit messages use semantic intent, for example:

feat: add meeting management
fix: correct session delete eligibility
docs: improve deployment guide
refactor: simplify session API
test: add release smoke tests
chore: clean generated artifacts

Stable releases are identified using semantic version tags.

Current baseline:

v1.0.0
Technology Stack
Oracle Database
Oracle APEX
Oracle REST Data Services (ORDS)
PL/SQL
SQLcl
OAuth 2.0
Git
GitHub
Project Goals

This repository serves both as:

a working training-management application;
a reusable reference for Oracle APEX, PL/SQL, ORDS and deployment practices.