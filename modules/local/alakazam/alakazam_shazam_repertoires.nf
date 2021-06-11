include { initOptions; saveFiles; getSoftwareName } from '../functions'

params.options = [:]
def options    = initOptions(params.options)

process ALAKAZAM_SHAZAM_REPERTOIRES {
    tag "report"
    label 'process_high'

    publishDir "${params.outdir}",
        mode: params.publish_dir_mode,
        saveAs: { filename -> saveFiles(filename:filename, options:params.options, publish_dir:'report', publish_id:'') }

    conda (params.enable_conda ? "conda-forge::r-base=4.0.3 conda-forge::r-alakazam=1.0.2 conda-forge::r-shazam=1.0.2" : null)              // Conda package
    if (workflow.containerEngine == 'singularity' && !params.singularity_pull_docker_container) {
        container "https://depot.galaxyproject.org/singularity/mulled-v2-3420a264d7f8006cc73fc3c3843d4545b235404f:4cc818718337222966d00ce39968abea1c328367-0"  // Singularity image
    } else {
        container "quay.io/biocontainers/mulled-v2-3420a264d7f8006cc73fc3c3843d4545b235404f:4cc818718337222966d00ce39968abea1c328367-0"                        // Docker image
    }

    input:
    tuple val(meta), path(tab) // sequence tsv table in AIRR format
    path("Table_sequences.tsv")

    output:
    tuple val(meta), path("${tab}"), emit: tab
    path("*.version.txt"), emit: version
    path("repertoire_comparison")
    path("Bcellmagic_report.html")

    script:
    def software = getSoftwareName(task.process)
    """
    execute_report.R "$projectDir/assets/repertoire_comparison.Rmd"
    Rscript -e "library(alakazam); write(x=as.character(packageVersion('alakazam')), file='${software}.version.txt')"
    Rscript -e "library(shazam); write(x=as.character(packageVersion('shazam')), file='shazam.version.txt')"
    echo \$(R --version 2>&1) | awk -F' '  '{print \$3}' > R.version.txt
    """
}