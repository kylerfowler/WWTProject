
import CloudKit

class TutorStore: ObservableObject {
    @Published var tutors = [Tutor]()
    
    func fetch(courseRecordID: CKRecord.ID) {
        tutors = []
        
        CloudKitHelper<Tutor>.fetch(courseRecordID: courseRecordID) { result in
            switch result {
            case .success(let newTutor):
                self.tutors.append(newTutor)

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func save(_ tutor: Tutor, courseRecordID: CKRecord.ID) {
        CloudKitHelper.save(tutor, courseRecordID: courseRecordID) { result in
            switch result {
            case .success(let newTutor):
                self.tutors.append(newTutor)

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}
