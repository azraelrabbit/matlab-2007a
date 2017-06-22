function job = pCreateJob(jm, jobType)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    name = [];
    timeout = intmax('int64');
    tag = '';
    maxW = intmax('int32');
    minW = 1.0;
    restart = false;
    fileList = {};
    fileData = [];
    pathList = {};
    jobData = [];
    productList = jm.pGetInitData;
    executionMode = 0.0;
    % 20 24
    % 21 24
    import com.mathworks.toolbox.distcomp.workunit.JobInfo;
    info = com.mathworks.toolbox.distcomp.workunit.JobInfo(name, timeout, tag, maxW, minW, restart, fileList, pathList, productList, fileData, jobData, jobType, executionMode);
    % 24 28
    % 25 28
    import com.mathworks.toolbox.distcomp.workunit.JobMLType;
    switch jobType
    case com.mathworks.toolbox.distcomp.workunit.JobMLType.STANDARD_JOB
        proxyJob = jm.ProxyObject.createJob(info);
    case com.mathworks.toolbox.distcomp.workunit.JobMLType.PARALLEL_JOB
        proxyJob = jm.ProxyObject.createParallelJob(info);
    otherwise
        error('distcomp:jobmanager:UnknownJobType', 'Invalid or unknown job type specified in database');
    end % switch
    % 35 38
    % 36 38
    constructor = jm.pGetUDDConstructorsForJobTypes(jobType);
    % 38 41
    % 39 41
    job = distcomp.createObjectsFromProxies(proxyJob, constructor, jm, 'norootsearch');
