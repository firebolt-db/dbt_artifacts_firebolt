# dbt_artifacts_firebolt

This package extends the [dbt_artifacts](https://github.com/brooklyn-data/dbt_artifacts) package to provide Firebolt database compatibility.

## What does this package do?

The `dbt_artifacts` package builds a mart of tables and views describing the project it's installed in. This extension package provides Firebolt-specific macro implementations to ensure compatibility with Firebolt databases.

## Installation

Add both packages to your `packages.yml` file:

```yaml
packages:
  - package: brooklyn-data/dbt_artifacts
    version: [">=2.0.0", "<3.0.0"]
  - git: "https://github.com/your-username/dbt_artifacts_firebolt.git"
    revision: main
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
