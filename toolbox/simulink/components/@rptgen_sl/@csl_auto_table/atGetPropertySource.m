function propSrc = atGetPropertySource(this, obj)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    psSL = rptgen_sl.propsrc_sl;
    propSrc = psSL.getPropSourceObject(psSL.getObjectType(obj));
end % function
