function xmlwrite(d, fName)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if lt(nargin, 2.0)
        fName = horzcat(tempname, '.', char(com.mathworks.toolbox.rptgencore.output.OutputFormat.getExtension('db')));
        % 11 13
    end
    % 13 17
    % 14 17
    % 15 17
    tfactory = javax.xml.transform.TransformerFactory.newInstance();
    serializer = tfactory.newTransformer();
    serializer.setOutputProperty(javax.xml.transform.OutputKeys.METHOD, 'xml');
    serializer.setOutputProperty(javax.xml.transform.OutputKeys.INDENT, 'yes');
    % 20 22
    errorListener = com.mathworks.toolbox.rptgencore.tools.TransformErrorListenerRG;
    serializer.setErrorListener(errorListener);
    % 23 25
    docLang = char(d.getDocumentElement.getAttribute('lang'));
    if strncmpi(docLang, 'ja', 2.0)
        serializer.setOutputProperty(javax.xml.transform.OutputKeys.ENCODING, 'shift_jis');
    else
        if not(strncmpi(docLang, 'en', 2.0))
            serializer.setOutputProperty(javax.xml.transform.OutputKeys.ENCODING, 'ISO-8859-1');
        end
    end
    serializer.transform(com.mathworks.xml.XMLUtils.transformSourceFactory(d), com.mathworks.xml.XMLUtils.transformResultFactory(fName));
end
