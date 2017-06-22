function pPreJobEvaluate(job, task)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    productKey = job.Serializer.getField(job, 'productkeys');
    job.pSetInitData(productKey);
    % 15 18
    % 16 18
    try
        if isempty(job.StartTime) && job.pCanModifyJobOnWorker
            set(job, 'StartTime', char(java.util.Date), 'State', 'running');
            % 20 23
            % 21 23
        end % if
    end % try
    % 24 27
    % 25 27
    distcomp.randomInit(labindex);
    % 27 31
    % 28 31
    % 29 31
    labBarrier;
