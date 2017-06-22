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
    distcomp.randomInit(task.ID);
end % function
