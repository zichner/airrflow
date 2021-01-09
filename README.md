# ![nf-core/bcellmagic](docs/images/nf-core-bcellmagic_logo.png)

**B cell repertoire analysis pipeline with the Immcantation framework.**.

[![GitHub Actions CI Status](https://github.com/nf-core/bcellmagic/workflows/nf-core%20CI/badge.svg)](https://github.com/nf-core/bcellmagic/actions)
[![GitHub Actions Linting Status](https://github.com/nf-core/bcellmagic/workflows/nf-core%20linting/badge.svg)](https://github.com/nf-core/bcellmagic/actions)
[![Nextflow](https://img.shields.io/badge/nextflow-%E2%89%A519.10.0-brightgreen.svg)](https://www.nextflow.io/)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.3607408.svg)](https://doi.org/10.5281/zenodo.3607408)
[![install with bioconda](https://img.shields.io/badge/install%20with-bioconda-brightgreen.svg)](https://bioconda.github.io/)
[![Docker](https://img.shields.io/docker/automated/nfcore/bcellmagic.svg)](https://hub.docker.com/r/nfcore/bcellmagic)
[![Get help on Slack](http://img.shields.io/badge/slack-nf--core%20%23bcellmagic-4A154B?logo=slack)](https://nfcore.slack.com/channels/bcellmagic)

## Introduction

The nf-core/bcellmagic pipeline is built to analyze B-cell repertoire sequencing data. It makes use of the [Immcantation 2.5.0](https://immcantation.readthedocs.io/en/version-2.5.0/) toolset and requires targeted sequencing data of the V, D, J and C regions of the B-cell receptor (primers for the V and C genes).

The pipeline is built using [Nextflow](https://www.nextflow.io), a workflow tool to run tasks across multiple compute infrastructures in a very portable manner. It comes with docker containers making installation trivial and results highly reproducible.

## Quick Start

1. Install [`nextflow`](https://nf-co.re/usage/installation)

2. Install any of [`Docker`](https://docs.docker.com/engine/installation/), [`Singularity`](https://www.sylabs.io/guides/3.0/user-guide/) or [`Podman`](https://podman.io/) for full pipeline reproducibility _(please only use [`Conda`](https://conda.io/miniconda.html) as a last resort; see [docs](https://nf-co.re/usage/configuration#basic-configuration-profiles))_

3. Download the pipeline and test it on a minimal dataset with a single command:

    ```bash
    nextflow run nf-core/bcellmagic -profile test,<docker/singularity/podman/conda/institute>
    ```

    > Please check [nf-core/configs](https://github.com/nf-core/configs#documentation) to see if a custom config file to run nf-core pipelines already exists for your Institute. If so, you can simply use `-profile <institute>` in your command. This will enable either `docker` or `singularity` and set the appropriate execution settings for your local compute environment.

4. Start running your own analysis!

    ```bash
    nextflow run nf-core/bcellmagic -profile <docker/singularity/podman/conda/institute> --input "metasheet_test.tsv" --cprimers "CPrimers.fasta" --vprimers "VPrimers.fasta"
    ```

See [usage docs](https://nf-co.re/bcellmagic/usage) for all of the available options when running the pipeline.

## Pipeline Summary

By default, the pipeline currently performs the following:

<!-- TODO nf-core: Fill in short bullet-pointed list of default steps of pipeline -->

* Sequencing quality control (`FastQC`)
* Overall pipeline run summaries (`MultiQC`)

## Documentation

The nf-core/bcellmagic pipeline comes with documentation about the pipeline: [usage](https://nf-co.re/bcellmagic/usage) and [output](https://nf-co.re/bcellmagic/output).

## Credits

nf-core/bcellmagic was originally written by Gisela Gabernet, Simon Heumos, Alexander Peltzer.

We thank the following people for their extensive assistance in the development
of this pipeline:

<!-- TODO nf-core: If applicable, make list of people who have also contributed -->

## Contributions and Support

If you would like to contribute to this pipeline, please see the [contributing guidelines](.github/CONTRIBUTING.md).

For further information or help, don't hesitate to get in touch on the [Slack `#bcellmagic` channel](https://nfcore.slack.com/channels/bcellmagic) (you can join with [this invite](https://nf-co.re/join/slack)).

## Citations

<!-- TODO nf-core: Add citation for pipeline after first release. Uncomment lines below and update Zenodo doi. -->
If you use  nf-core/bcellmagic for your analysis, please cite it using the following doi: [10.5281/zenodo.3607408](https://doi.org/10.5281/zenodo.3607408)

You can cite the `nf-core` publication as follows:

> **The nf-core framework for community-curated bioinformatics pipelines.**
>
> Philip Ewels, Alexander Peltzer, Sven Fillinger, Harshil Patel, Johannes Alneberg, Andreas Wilm, Maxime Ulysse Garcia, Paolo Di Tommaso & Sven Nahnsen.
>
> _Nat Biotechnol._ 2020 Feb 13. doi: [10.1038/s41587-020-0439-x](https://dx.doi.org/10.1038/s41587-020-0439-x).
> ReadCube: [Full Access Link](https://rdcu.be/b1GjZ)

In addition, references of tools and data used in this pipeline are as follows:

<!-- TODO nf-core: Add bibliography of tools and data used in your pipeline -->
