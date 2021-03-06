//
//  PersistentContainerMock.swift
//  FamHub
//
//  Created by Marcelo Farjalla on 3/4/20.
//  Copyright © 2020 StackRank, LLC. All rights reserved.
//

import Foundation
import CoreData

class PersistentContainerMock {
  lazy var mockPersistantContainer: NSPersistentContainer = {

      let container = NSPersistentContainer(name: "FamHub", managedObjectModel: self.managedObjectModel)
      let description = NSPersistentStoreDescription()
      description.type = NSInMemoryStoreType
      description.shouldAddStoreAsynchronously = false // Make it simpler in test env

      container.persistentStoreDescriptions = [description]
      container.loadPersistentStores { (description, error) in
          // Check if the data store is in memory
          precondition( description.type == NSInMemoryStoreType )

          // Check if creating container wrong
          if let error = error {
              fatalError("Create an in-mem coordinator failed \(error)")
          }
      }
      return container
  }()

  private lazy var managedObjectModel: NSManagedObjectModel = {
      let managedObjectModel = NSManagedObjectModel.mergedModel(from: [Bundle(for: type(of: self))] )!
      return managedObjectModel
  }()

}

