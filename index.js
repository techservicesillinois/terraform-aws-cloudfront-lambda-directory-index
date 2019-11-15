/*
 * Git commit hash: @TAG@
 */

'use strict';

exports.handler = (event, context, callback) => {

    // Extract the request from the CloudFront event sent to Lambda@Edge.
    var request = event.Records[0].cf.request;

    // Extract the URI from the request.
    var olduri = request.uri;

    // Match a trailing '/' in the URI, and replace with "index.html".
    var newuri = olduri.replace(/\/$/, '\/index.html');

    // If we rewrote the URI, log both the old and new values.
    if (newuri != olduri) {
        console.log("rewrote URI from '" + olduri + "' to '" + newuri + "'")
    }

    // Update the request with the modified URI and return to CloudFront.
    request.uri = newuri;
    return callback(null, request);

};
