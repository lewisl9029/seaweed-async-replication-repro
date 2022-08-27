# seaweed-async-replication-repro

Set up to help with debugging issues raised here: https://github.com/seaweedfs/seaweedfs/discussions/3529#discussioncomment-3488343

How it works:

Spins up 2 Seaweed instances, 1 primary and 1 replicated, and respective redis filer stores. 

Primary uses Procfile.primary and runs `./app/backup.sh` to run async backup to an S3 Bucket.

Replicated uses Procfile and runs `./app/sync.sh` to run active-active replication to primary.

Repro steps below:

## Add required env vars in a `.env` file

Password for redis instance acting as the Seaweed Filer Store:

```
WEED_REDIS2_PASSWORD=some-password
REDIS_PASSWORD=some-password
```

AWS access key and secret with access to a bucket named `storage-backup-development` (rename in `docker-compose.yml`) for async backup:

```
WEED_SINK_S3_AWS_ACCESS_KEY_ID=access-key-id
WEED_SINK_S3_AWS_SECRET_ACCESS_KEY=secret-access-key
```

## Start containers using `docker-compose up`

Wait until both localhost:58088 and localhost:58093 become available with the Seaweed UI.

## Run `node put.js` to put a file with metadata headers in the primary instance

Note this requires node 18 for native fetch support. Feel free to use curl or something else to do this instead if preferred.

## Check response at primary instance and replicated instance

http://localhost:58088/resources/test1 and http://localhost:58093/resources/test1 respectively.

Issue 1: Note that the response from primary will have a `Seaweed-Meta` header with value `{"metadata":1234}`, while the response at the replicated instance will not.

## Check file at `/resources/test1` in `storage-backup-development` bucket 

Issue 2: Note that `/resources/test` doesn't have any tags with the data included in the `Seaweed-Meta` header.