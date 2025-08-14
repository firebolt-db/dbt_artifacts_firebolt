# dbt_artifacts_firebolt

This package extends the [dbt_artifacts](https://github.com/brooklyn-data/dbt_artifacts) package to provide Firebolt database compatibility.

## What does this package do?

The `dbt_artifacts` package builds a mart of tables and views describing the project it's installed in. This extension package provides Firebolt-specific macro implementations to ensure compatibility with Firebolt databases.

## Installation

Add the package to your `packages.yml` file:

```yaml
packages:
  - package: firebolt-db/dbt_artifacts_firebolt
    version: 0.1.0
```

Run `dbt deps` to install the packages.

## Configuration

Add the on-run-end hook to your `dbt_project.yml`:

```yaml
on-run-end:
  - "{{ dbt_artifacts.upload_results(results) }}"
```

For production-only tracking, use a conditional:

```yaml
on-run-end:
  - "{% if target.name == 'prod' %}{{ dbt_artifacts.upload_results(results) }}{% endif %}"
```

Disable documentation persistence, since Firebolt does not support table-level and column-level comments:
In `dbt_project.yml` add to your `models` section:
```yaml
models:
  +persist_docs:
    relation: false
    columns: false
```

## Usage

This package works automatically once installed. The Firebolt-specific macros will be used when running against a Firebolt database, providing the same functionality as the base `dbt_artifacts` package.

## Supported Features

- Model execution tracking
- Test execution tracking
- Seed execution tracking
- Snapshot execution tracking
- Source tracking
- Exposure tracking
- Metrics tracking
- Invocation tracking

## Firebolt-Specific Implementations

This package provides Firebolt-specific implementations for:

- String manipulation functions (`str_left`)
- Comment operations (no-op implementations)
- DML operations for all artifact types
- Custom insert operations optimized for Firebolt

## Requirements

- dbt >= 1.3.0
- Firebolt database
- dbt-firebolt adapter

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.
