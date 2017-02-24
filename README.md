# CloudKitAssessment
I can't get my views to refresh properly. I think there's something wrong with my completion in my fetch function. 

I'm not sure how to edit a record. I know about the CKModifyRecordsOperation but it takes a record as an imput, and I'm not sure how to put the recordID into the record when its created in the computed property. .recordID is a get only property. So then I don't have the record to give to the CKModifyRecordsOperation. So I just deleted the old record and created a new one. 

The cloudkit functions are all doing what they are supposed to, I just can't get the views quite right. So I threw in a reload data button to demonstrate the functions are working in the background. might have to press it twice for it to display an edit of a record. Couldn't get the async to work in my viewdidload and willappear in the completion of the fetch function, so I didn't try in my reload data button.
