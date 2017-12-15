trigger Before_Insert_Account on Account (before insert) {
    System.debug('Record Inserted');
}