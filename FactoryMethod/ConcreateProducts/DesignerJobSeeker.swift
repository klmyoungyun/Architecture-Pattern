import Foundation

public class DesignerJobSeeker: JobSeekerProtocol {
  private var contact: Contact
  
  init(contact: Contact) {
    self.contact = contact
  }
  
  public func sendRequestResumeEmail() -> String {
    return "Dear \(contact.name) Designer!"
  }
}
