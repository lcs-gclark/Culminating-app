import Foundation

@Observable
class FieldListViewModel {
    func filterTodos(on searchTerm: String) async throws {
    
    if searchTerm.isEmpty {

        // Get all the to-dos
        Task {
            try await getFields()
        }

    } else {

        // Get a filtered list of to-dos
        do {
            let results: [FieldItem] = try await supabase
                .from("fields")
                .select()
                .ilike("title", pattern: "%\(searchTerm)%")
                .order("id", ascending: true)
                .execute()
                .value

            self.fields = results

        } catch {
            debugPrint(error)
        }

    }

}
    
    // MARK: Stored properties
    // The list of to-do items
 @ObservationIgnored private var fields: [FieldItem]
    
    // MARK: Initializer(s)
    init(fields: [FieldItem] = []) {
        self.fields = fields
        
        Task {
            try await getFields()
        }

    }
    
    // MARK: Functions
    func getFields() async throws {
        
        do {
            let results: [FieldItem] = try await supabase
                .from("fields")
                .select()
                .order("id", ascending: true)
                .execute()
                .value
            
            self.fields = results
            
        } catch {
            debugPrint(error)
        }
        
    }
    func createField(withTitle title: String) {
        
        // Create a unit of asynchronous work to add the to-do item
        Task {
            
            // Create the new to-do item instance
            // NOTE: The id will be nil for now
            let field = FieldItem(
                title: title,
                done: false
            )
            
            // Write it to the database
            do {
                
                // Insert the new to-do item, and then immediately select
                // it back out of the database
                let newlyInsertedItem: FieldItem = try await supabase
                    .from("fields")
                    .insert(field)   // Insert the todo item created locally in memory
                    .select()       // Select the item just inserted
                    .single()       // Ensure just one row is returned
                    .execute()      // Run the query
                    .value          // Automatically decode the JSON into an instance of TodoItem

                // Finally, insert the to-do item instance we just selected back from the
                // database into the array used by the view model
                // NOTE: We do this to obtain the id that is automatically assigned by Supabase
                //       when the to-do item was inserted into the database table
                self.fields.append(newlyInsertedItem)
                
            } catch {
                debugPrint(error)
            }
        }
    }
    
    func delete(_ todo: FieldItem) {
            
            // Create a unit of asynchronous work to add the to-do item
            Task {
                
                do {
                    
                    // Run the delete command
                    try await supabase
                        .from("fields")
                        .delete()
                        .eq("id", value: todo.id!)  // Only delete the row whose id
                        .execute()                  // matches that of the to-do being deleted
                    
                    // Update the list of to-do items held in memory to reflect the deletion
                    try await self.getFields()

                } catch {
                    debugPrint(error)
                }
                
                
            }
                    
        }
    
    func update(field updatedField: FieldItem) {
            
            // Create a unit of asynchronous work to add the to-do item
            Task {
                
                do {
                    
                    // Run the update command
                    try await supabase
                        .from("fields")
                        .update(updatedField)
                        .eq("id", value: updatedField.id!)   // Only update the row whose id
                        .execute()                          // matches that of the to-do being deleted
                        
                } catch {
                    debugPrint(error)
                }
                
            }
            
        }
}
