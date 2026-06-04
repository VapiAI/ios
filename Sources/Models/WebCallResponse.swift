//
//  WebCallResponse.swift
//
//
//  Created by Andrew Carter on 12/13/23.
//

import Foundation

public struct ArtifactPlan: Decodable {
    // Optional because the Vapi server response no longer always
    // includes this field under `artifactPlan` — it moved into
    // `transport.videoRecordingEnabled`. Making it `Bool?` keeps
    // the SDK's strict decoder from throwing `keyNotFound` on a
    // missing key, which previously caused every `vapi.start()`
    // call to fail immediately with an `.callDidEnd` event and
    // no transcript.
    public let videoRecordingEnabled: Bool?
}

public struct WebCallResponse: Decodable {
    let webCallUrl: URL
    public let id: String
    public let artifactPlan: ArtifactPlan?
}
