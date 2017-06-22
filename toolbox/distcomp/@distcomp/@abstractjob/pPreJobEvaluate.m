function pPreJobEvaluate(job, task)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    productKey = job.Serializer.getField(job, 'productkeys');
    job.pSetInitData(productKey);
    % 19 23
    % 20 23
    % 21 23
    try
        if isempty(job.StartTime)
            set(job, 'StartTime', char(java.util.Date), 'State', 'running');
            % 25 28
            % 26 28
        end % if
    end % try
    % 29 32
    % 30 32
    distcomp.randomInit(task.ID);
