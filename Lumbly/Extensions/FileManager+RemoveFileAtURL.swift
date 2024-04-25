//
//  FileManager+RemoveFileAtURL.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2024-04-24.
//

import Foundation

extension FileManager {
    func removeFile(atURL fileURL: URL?) {
        guard let fileURL = fileURL,
              self.fileExists(atPath: fileURL.path) else {
            // TODO: Handle error
            print("Url does not exist")
            return
        }

        do {
            try self.removeItem(atPath: fileURL.path)
        } catch {
            // TODO: Handle error
            print("Error removing file at url: \(fileURL)")
        }
    }
}
