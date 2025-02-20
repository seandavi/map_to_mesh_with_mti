# Run MTI in batch mode with Docker image

MTI is the main product of the Indexing Initiative project and has been providing indexing recommendations based on the Medical Subject Headings (MeSH®) vocabulary since 2002. See [MTI Documentation and Home Page for details](https://ii.nlm.nih.gov/MTI/).

## Build docker

```sh
docker build -t seandavi/mti_batch .
docker push seandavi/mti_batch
```

## Running

- [MTI documentation](https://ii.nlm.nih.gov/resource/MTI_help_info.html)

1. Place file(s) to be analyzed into docker container with volume mount.
2. Run docker container specifying environment variables `USERNAME` and `PASSWORD`. **Use your UMLS username and password here; ie., you need a UMLS account**.
3. Capture stdout from container, as that will be the output

```sh
docker run -v input_dir:/data \
    -e USERNAME="UMLS_USERNAME" \
    -e PASSWORD="UMLS_PASSWORD" \
    seandavi/mti_batch [OPTIONS] inputFile
```

Options include:

```
  allowed options:
    --email <address> : set email address. (required option)
    --command <name> : batch command: metamap, semrep, etc. (default: MTI -opt1L_DCMS -E)
    --note <notes> : batch notes
    --silent : don't send email after job completes.
    --silent-errors : Silent on Errors
    --singleLineInput : Single Line Delimited Input
    --singleLinePMID : Single Line Delimited Input w/ID
    --priority : request a Run Priority Level: 0, 1, or 2
```
