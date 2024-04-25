//
//  AZSUpload.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2024-04-22.
//

import AZSClient

class AZSUpload {
    let resource: AZSUploadResource
    
    init(resource: AZSUploadResource) {
        self.resource = resource
    }
    
    func execute() async throws {
        try await upload()
    }
}

extension AZSUpload {
    private func upload() async throws {
        let blockBlob = try await createBlockBlob()
        let inputStream = try getInputStream()
        
        do {
            try await blockBlob.upload(from: inputStream)
        } catch {
            throw NetworkError.UploadError.uploadFailure
        }
    }
    
    private func createBlockBlob() async throws -> AZSCloudBlockBlob {
        let blobContainer = try await createBlobContainer()
        return blobContainer.blockBlobReference(fromName: resource.uploadName)
    }
    
    private func getInputStream() throws -> InputStream {
        guard let data = try? Data(contentsOf: resource.fileURL) else {
            throw NetworkError.UploadError.dataExtractionFailure
        }
        
        return InputStream(data: data)
    }
    
    private func createBlobContainer() async throws -> AZSCloudBlobContainer {
        let account = try await fetchAccount()
        let blobClient: AZSCloudBlobClient = account.getBlobClient()
        let blobContainer: AZSCloudBlobContainer = blobClient.containerReference(fromName: resource.containerName)
        
        do {
            try await blobContainer.createContainerIfNotExists()
        } catch {
            throw NetworkError.UploadError.containerCreationFailure
        }
        
        return blobContainer
    }
    
    private func fetchAccount() async throws -> AZSCloudStorageAccount {
        let connectionString = try await fetchConnectionString()
        guard let account = try? AZSCloudStorageAccount(fromConnectionString: connectionString) else {
            throw NetworkError.UploadError.accountConnectionFailure
        }
        
        return account
    }
    
    private func fetchConnectionString() async throws -> String {
        let resource = ConnectionStringResource()
        let request = APIRequest(resource: resource)
        let connectionStringData = try? await request.execute()

        guard let connectionStringData = connectionStringData,
              let connectionString = String(data: connectionStringData, encoding: .utf8) else {
            throw NetworkError.UploadError.badConnectionString
        }

        return connectionString
    }
}
