# CodeCheckSystem
Calculate the similarity of code files

* The design significance of this system is to provide an online platform to evaluate the degree of plagiarism in computer class course code 
operations, and to provide the teacher of the programming course an efficient and accurate check tool for judging code assignments. 
This system uses ASP.NET Web Forms as the server technology, Sql Server as a database to store user information, and the text structure 
is measured by using SIM algorithm, fingerprint acquisition and Winnowing algorithm, and then code structure similarity and text similarity
are calculated.

* The system includes three functional modules: user management, check management and calculation module. The core function 
is to check management module and calculation module. The check management module implements downloading the result file which calculated 
from running algorithm and uploading files, and the interact information between user and server. The calculation result calculated by 
the calculation module which can distinguish the difference between the plagiar code and the autonomous completion more accurately, 
and at the same time implement the filtering of the calculation result by the user. The result is similar to the results of the Dutch 
scientist Dick Grune's SIM check tool between 1% and 5%. When the teacher checks the student's code assignments, system can use code 
highlighting to show the code on the website page, calculate the code similarity accurately and efficiently, and easy to use. Just upload 
the code file to run the calculation and download the result file.

Address: http://192.168.191.1:82/
