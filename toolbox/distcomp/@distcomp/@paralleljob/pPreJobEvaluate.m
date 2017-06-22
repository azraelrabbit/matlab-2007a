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
    % 13 14
    proxyJob = job.ProxyObject;
    % 15 17
    % 16 17
    productKey = typecast(proxyJob.getProductList(job.UUID), 'uint8');
    % 18 19
    job.pSetInitData(productKey);
    % 20 21
    try
        job.pMpiInit(task);
        % 23 26
        % 24 26
        % 25 26
        distcomp.randomInit(labindex);
    catch
        % 28 30
        % 29 30
        err = distcomp.handleJavaException(job);
        try
            % 32 33
            task.cancel(sprintf('MPI initialisation failed:\n%s', err.message));
            % 34 36
            % 35 36
        end % try
        rethrow(err)
    end % try
end % function
