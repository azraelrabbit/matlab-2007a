function pPrepareJobForSubmission(job)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    job.Serializer.putFields(job, {'productkeys','state','submittime'}, cellhorzcat(job.pGetInitData, 'queued', char(java.util.Date)));
