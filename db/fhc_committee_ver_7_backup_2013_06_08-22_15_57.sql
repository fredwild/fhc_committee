-- MySQL dump 10.13  Distrib 5.5.29, for Win32 (x86)
--
-- Host: localhost    Database: fhc_committee_development
-- ------------------------------------------------------
-- Server version	5.5.29-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `fhc_committee_development`
--

/*!40000 DROP DATABASE IF EXISTS `fhc_committee_development`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `fhc_committee_development` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `fhc_committee_development`;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `seq_no` int(11) DEFAULT NULL,
  `task_task_obj_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_announcements_task_task_obj_id` (`task_task_obj_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
INSERT INTO `announcements` (`id`, `topic`, `description`, `seq_no`, `task_task_obj_id`) VALUES (1,'Message to Public Librarians in Rhode Island','(Sent from nefamilyhistory@gmail.com.  Included flyer as attachment - page 1 8x11 poster, page 2 program grid)\r\n\r\nHello Librarians,\r\n\r\nThe Hingham Stake of the Church of Jesus Christ of Latter-day Saints is sponsoring our annual FREE New England Family History Conference on March 30, 2013.  Our on-line pre-registration for the conference is open and we wish to invite you and all of your patrons to come to the conference.  The conference is very popular and generally draws about 75% non-LDS members.  We have not advertised extensively in Rhode Island before so I hope to change that and have more Rhodies at the conference this year.  :)\r\n\r\nI have attached a flyer for the conference.  I hope you will print it out and post it in a visible place in your libary.  Another idea is to print out a few (double-sided) as flyers that people can take home with them.  For additional information, our website is www.nefamilyhistory.com\r\n \r\nI have included every library in Rhode Island that has a website where I could find an email address.  Please forward this message to anyone you think might have an interest.\r\n\r\nHope to see you at the conference.\r\n\r\nThank you.\r\n \r\nSincerely,\r\n\r\nDiana\r\n\r\n2013 NE Family History Conference Committee\r\n\r\nPS: Please respond to this message, if you would like to be removed from this list or if a different email address should be used in the future.  Otherwise, we will keep you on the list and send you a similar message for next year\'s conference.',1,167);
INSERT INTO `announcements` (`id`, `topic`, `description`, `seq_no`, `task_task_obj_id`) VALUES (2,'Pre-registration Open','(Sent from Mail Chimp)\r\n\r\nHello Everyone,\r\n \r\nPre-registration for the New England Family History Conference in Franklin, MA is now open.  Please go to our website at www.nefamilyhistory.com and register as a participant.\r\n \r\nNote that if the name of the class contains the words Beginner or Basic it is just that, otherwise the class is at the intermediate level.\r\n \r\nNO ROADSHOW - there will be no formal ancestor\'s roadshow, i.e., short one-on-one meetings between a participant and a genealogist, this year.  Please approach the speaker directly and to ask a specific question.\r\n \r\nWe have updated the driving directions on the website to be more clear.  We have removed the section on public transportation.  There is a train station in Franklin and there are taxis available.\r\n \r\nPlease make sure to use the same email address on our website as is used for this message.  If you have questions about this please email us.\r\n \r\nWe look forward to seeing you at this years conference.\r\n \r\n2013 NE Family History Conference Committee',2,74);
INSERT INTO `announcements` (`id`, `topic`, `description`, `seq_no`, `task_task_obj_id`) VALUES (3,'SAVE THE DATE','(Sent via Mail Chimp)\r\n\r\nHello Fellow Family Historians,\r\n \r\nSAVE THE DATE - Saturday, March 30, 2013 - New England Family History Conference\r\n \r\nIf you are receiving this message, it is because you have either participated in one of our past\r\n Family History conferences or you have shown interest in a future conference.\r\n \r\nPlanning has begun for the 2013 New England Family History Conference. The new committee\r\n is still forming, but the leadership has some really good ideas for 2013.\r\n \r\nStay tuned for more information as the plans unfold...\r\n \r\nWe look forward to another wonderful day of learning about our ancestors from an array of\r\n talented genealogists. We also look forward to seeing all of you there to share it with us. Once\r\n pre-registration opens, in January, we will send out another message directing you to pre-register\r\n at our website. If you know anyone else who might be interested, please forward this email to them.\r\n \r\n2013 New England Family History Conference Committee',3,75);
INSERT INTO `announcements` (`id`, `topic`, `description`, `seq_no`, `task_task_obj_id`) VALUES (4,'Invitation to Hingham Stake Members','(Sent by Stake Presidency to the Stake Membership)\r\n\r\nDear Members of the Hingham Stake,\r\n\r\nWhen you were baptized, your ancestors looked down on you with hope.  Their hearts are bound to you. Their hope is in your hands.\r\n         Henry B. Eyring\r\n\r\nPre-registration for the New England Family History Conference at the stake center in Franklin, MA is now OPEN. Please go to our website at www.nefamilyhistory.com and register as a participant. Pre-registration will close on March 15, so please register soon!\r\n\r\nStake members may not realize that this conference is a very large event that attracts participants from all over New England and beyond. Although we welcome community members with open arms, the conference\'s primary goal is to help YOU with searching out and providing saving ordinances for YOUR kindred dead.  Whether you are new to genealogy or have lost your momentum, the conference is the perfect opportunity to get started  - or re-started - putting your family history together and developing/deepening your testimony of family history work. Come search for your ancestors and feel the spirit of Elijah. Whether you can come for a single class or the whole conference, you will be sure to learn something and to feel the spirit, and find some energy and enthusiasm for your family history.\r\n\r\nBrother Tom Kemp will be teaching a class specifically directed at ward leaders, on how improving and building enthusiasm for family history in our wards and branches. Ward council members and all family history consultants, please register for this class, as it is meant for you! \r\n\r\nFor all other classes, if the name of the class contains the words Beginner or Basic it is just that, otherwise the class is at the intermediate level. \r\n\r\nThe Franklin Family History Center will be open and consultants available for the duration of the conference, so if you would like assistance or to use the center, feel free to bring your materials and come in.\r\n\r\nThere will be NO formal ancestor\'s ROADSHOW this year, i.e., short one-on-one meetings between a participant and a genealogist. Please approach a speaker directly if you would like to ask a specific question.\r\n\r\nPlease make sure to use the same email address on our website as is used for this message. If you have questions  please email us.\r\n\r\nSee you at this year\'s conference!\r\n\r\n2013 NE Family History Conference Committee',4,168);
INSERT INTO `announcements` (`id`, `topic`, `description`, `seq_no`, `task_task_obj_id`) VALUES (5,'Instruction to Hosts','Some time ago you volunteered to serve as a host for one of the presenters at the NE Family History conference on March 30. At this time I am making assignments for Hosts for each of our Presenters, and I\'ve assigned to you Joe Rogge.\r\n\r\nThe duties for the host for each presenter are not onerous, but they are important so that the day is smooth and pleasant for each of our conference speakers.\r\n\r\nOne of the main responsibilities of the host will be to introduce the presenter at the beginning of each class. Feedback from previous years has indicated that conference attendees would like the introductions to be brief, not just a reading of the brief bio from the conference website, and not the same if presenters are teaching more than one class (if possible, customized to the specific class). Prior to contacting your presenter, read through their bio and their class descriptions, and spend a few minutes thinking of a few questions you could ask to gather information that you could use to prepare a short, customized introduction. (You don\'t need to spend a lot of time - maybe why they chose the particular topic, why it interested them, etc.).\r\n\r\nWhen you contact your speaker prior to the day of conference, introduce yourself and let them know that you will be there to greet, assist and answer questions for them personally. Tell them that when they arrive at the conference, they should identify themselves as a presenter and ask for you by name. Then ask:\r\n  \r\nYour prepared questions \r\n What type of sandwich do they want in their lunch (turkey or ham)?\r\nDo they want a syllabus (we will provide one free of charge, upon request - not all speakers want one)\r\nIf they have any needs they expect to have the day of the conference (table, overhead projector & screen, etc.)\r\n Please ensure that they have the address of the stake center (if they need it).\r\nProvide your contact information so that if they have questions, they can contact you prior to conference day.\r\n \r\nAnd don\'t forget to thank them for their willingness to present at the conference! After all, the speakers are doing this without monetary compensation, so it\'s always good to be gracious and show appreciation.\r\n\r\nSpeaking of, many thanks to YOU for your willingness to assist by serving as a host. There are many, many tasks that need doing before, during, and after conference to make it a success, so thank you for taking care of this part.\r\n\r\nHere\'s Joe\'s contact information:\r\n\r\nJoe Rogge\r\njorogge2001@aol.com\r\nSessions 1 & 2 Basic Computer Skills\r\n\r\nPlease contact me if you have any questions.\r\n\r\nThanks again,\r\n\r\nSylvia Lyons\r\n\r\nNE Family History Co-Chair',5,169);
INSERT INTO `announcements` (`id`, `topic`, `description`, `seq_no`, `task_task_obj_id`) VALUES (6,'Request to FH Consultants to be in FHC during Conference','(Sent by Sylvia to the speakers)\r\n\r\nHello to all,\r\n\r\nI hope all is going well for everyone in your family history work! Congratulations to those of you who have finished your training. I appreciate you taking time out of your busy schedules to do this important work. For those of you who have not yet completed your consultant or Family Tree training, please continue to work on it and remember to contact me and let me know as soon as you have finished.\r\n\r\nAs you may already know, registration for the annual NE Family History Conference is OPEN. It will again be held at the stake center in Franklin, on Saturday, March 30.\r\n\r\nSomething new for the conference this year will be having the Franklin Family History Center open and staffed to assist patrons during the conference. You may recall that to this end, I am asking that all family history consultants from the stake (not just from Franklin) serve for a one-hour shift (or more) during the conference, if at all possible. We hope, of course, that you will take advantage of being there and register as a participant and take one or more classes. We hope, also, to identify each of you as a Family History consultant on your name tag, so that other  attendees who may not be familiar with the various family history centers throughout the stake may meet you and thus have a personal contact with someone whom they can reach out to after the conference has concluded.\r\n\r\nThe shifts in the library during the conference correspond to the class sessions, lunch break, and networking:\r\n\r\nSession 1:    9:30 - 10:30 \r\nSession 2:    10:40 - 11:40\r\nLunch           11:40 - 12:40\r\nSession 3:    12:40 - 1:40\r\nSession 4:     1:50 - 2:50\r\nNetworking   3pm - 4pm\r\n\r\nPlease let me know as soon as possible which shift(s) you are available to to cover. \r\n\r\nIn addition, I am still looking for a few more consultants willing to serve as hosts for our Presenters on the day of the conference. This responsibility includes: contacting the presenter prior to the conference to obtain a little information to introduce them to their class(es) on conference day, meeting and greeting them on conference day, giving them their speaker packet and orientation (if they haven\'t been to the building previously), being on hand to assist or find help if they need it, and briefly introducing them to their class(es). This isn\'t a huge task, but we are still a few hosts short and could use a few more volunteers. Please let me know if you are willing to serve as a host.\r\n\r\nThank you for your support for the Family History Conference. And don\'t forget to register to attend!\r\n\r\nRegards,\r\n\r\nSister Sylvia Lyons\r\nStake Family History Director\r\nNE Family History Conference Co-Chair',6,NULL);
INSERT INTO `announcements` (`id`, `topic`, `description`, `seq_no`, `task_task_obj_id`) VALUES (7,'Syllabus Downloads Available','Hello 2013 Participants,\r\n\r\nThe syllabus inserts for many of the classes have been posted at the website www.nefamilyhistory.com  When you go back to the site, you do not need to re-register, just enter the username and password that you created when you registered.  If you ordered a paper syllabus, you do not need to download the syllabus, but you are welcome to if you wish.\r\n\r\nTo use the download capability, just click on My Conference from the main page, provide your username and password, and click on Syllabus Section Downloads on the top right of the page.  Clicking on this will take you to a list of all the classes.  You will see a yellow smiley face next to the classes for which you signed up.  If a Syllabus Insert has been posted, you will see a green link under the name of the class.  Click on the green link, it will give you the option to print the file (PDF) or save it.  We recommend you save the file to your hard drive and then print the file from there.  The smileys are for your convenience, you are not limited to the classes for which you signed up.\r\n\r\nWe will notify you once more when all syllabus inserts are available, until then check the website as frequently as you like to see if new inserts have become available.\r\n \r\nMake sure to get your downloading done early as the system will slow down if everyone is downloading at the same time the night before the conference.\r\n \r\nHappy Downloading!!  :)\r\n \r\nSee you soon.\r\n \r\n2013 NE Family History Conference Committee',7,57);
INSERT INTO `announcements` (`id`, `topic`, `description`, `seq_no`, `task_task_obj_id`) VALUES (8,'2013 Conference Evaluation Message','Hello Everyone,\r\n\r\nThank you all for providing the warmth and spirit for our 2013 Conference.  One last thing to do and that is to collect your feedback on the day so that we can ensure that next year is even better.\r\n\r\nPlease go to our website at  www.nefamilyhistory.com  There is no need to log in or remember any usernames/passwords.\r\n\r\nA new item has been added on the bottom right in green, 2013 Conference Evaluation.  When you click on it it will take you directly to the Evaluation form.\r\n\r\nThanks, in advance, for your ideas and thoughts.\r\n\r\nThe 2013 Committee',8,82);
INSERT INTO `announcements` (`id`, `topic`, `description`, `seq_no`, `task_task_obj_id`) VALUES (9,'Payment Outstanding Email Reminder','Dear Participant,\r\n\r\n\r\n\r\n\r\nWe are pleased that you are coming to the New England Family History Conference!  As of Wednesday, February 28, 2013, we have not yet received your check payment for either a pre-ordered lunch or syllabus.  If it is in the mail, please disregard.  Otherwise, please send your check to NE Family History Conference, PO Box 171510, Boston, MA 02117.  \r\n\r\n\r\n\r\n\r\n Thank you,\r\n\r\n\r\n\r\nDane Heilner\r\n\r\n NE Family History Conference Committee\r\n\r\ndheilner@gmail.com',9,103);
INSERT INTO `announcements` (`id`, `topic`, `description`, `seq_no`, `task_task_obj_id`) VALUES (10,'Pre-registration Closed','',10,213);
INSERT INTO `announcements` (`id`, `topic`, `description`, `seq_no`, `task_task_obj_id`) VALUES (11,'Speaker Evaluation Available','Hello everyone,\r\n\r\nAs part of the follow-up to our 2013 conference, we have prepared a brief (10 questions) survey for our presenters to help us better serve both the presenters and the conference participants. If you would please take the time to complete the survey, it would be greatly appreciated by the conference committee. Please click on the following link to access the survey:  NE Family History Conference Speaker Survey  If the link is broken, please enter this URL into your browser: https://www.surveymonkey.com/s/NVYHY76 \r\n\r\n\r\n \r\nAnd again, a great big THANK YOU for your willingness to come and share your knowledge and expertise. We could not put on the conference without you!\r\n\r\nRegards,\r\n\r\nSylvia Lyons\r\nNE Family History Conference Co-Chair\r\nHingham Stake Family History Director',11,230);
INSERT INTO `announcements` (`id`, `topic`, `description`, `seq_no`, `task_task_obj_id`) VALUES (12,'Committee Evaluation Available','Send email to all committee members inviting them to fill out the on-line survey at Survey Monkey',12,231);
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `committee_roles`
--

DROP TABLE IF EXISTS `committee_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `committee_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `calling_required` tinyint(1) DEFAULT NULL,
  `seq_no` int(11) DEFAULT NULL,
  `committee_committee_id` int(11) DEFAULT NULL,
  `name_tag_needed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_committee_roles_committee_committee_id` (`committee_committee_id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `committee_roles`
--

LOCK TABLES `committee_roles` WRITE;
/*!40000 ALTER TABLE `committee_roles` DISABLE KEYS */;
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (1,'Executive Sponsor','Provides executive leadership and guidance on overall shape and objectives of the conference.  Provides decision making regarding new expenses.',1,1,1,1);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (2,'Stake High Council Advisor','Provides communication line with High Council.  Publicizes conference through the stake using church communication channels, helps identify resources throughout the stake for the calling based roles.  May play a lead role on certain sub-committees, e.g., publicity, setup or cleanup.  Arranges for \"payment\" of air travel, where needed.  Oversees Accounting Committee.',1,2,1,1);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (3,'Co-chair','Provides leadership and management capabilities to ensure all aspects of the conference run smoothly. Oversees assigned sub-committees.  Resolves cross-committee issues and ensures all conference committee members feel well supported.  Escalates issues where necessary. Monitors progress of selected sub-committees (each of two co-chairs is assigned set of sub-committees).  Schedules meetings, develops agenda for meetings with input from committee members, participates in selected sub-committee leads.',1,3,1,1);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (5,'Host Committee Lead','Oversees the Speaker Host committee, supports the committee members to ensure they have resources they need. There are specialized resources in this case, including member homes to host speakers, member support in providing transportation, etc. Resolves issues for speaker hosts.  Ensures the quality of the content of the website regarding speakers and presentations.  www.nefamilyhistory.com',1,7,2,1);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (6,'Speaker Host','Takes over for Program Committee member to follow up with speaker and interfaces with other committee members and leadership to resolve any issues.  Helps speaker on the day of the conference.  Ensures they have water, tissues, anything else. Introduces the speaker (reads bio or speaker provided introduction). Maybe a FH Consultant.',0,60,2,1);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (7,'Unassigned','This role is used when no role has been assigned to a person registering as a committee member.',0,62,1,NULL);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (8,'Speaker Gift Designer','Designs thank-you gift for each speaker. Purchases gift(s), wraps and delivers gift to speaker lounge on the day of the conference. Gift is subject to budget set by Conference Committee leadership.',0,70,2,0);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (9,'Registration Committee Lead','Ensures that the participants enjoy a smooth registration process both during the on-line pre-registration and day-of registration.  Resolves any issues with the participants during pre-registration, i.e., monitors conference email and escalates issues as needed.  participant records are accurate and complete in preparation for assembling the participant packets.',1,5,3,1);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (44,'Treasurer','Ensures that payment information is correctly recorded at www.nefamilyhistory.com. Receives checks and ensures that checks are handled according to church policies.  Arranges for short term PO Box in convenient location.  Collects checks from PO Box. Records payments in conference web base.  Works closely with Registration Lead to resolve participant issues during pre-registration (extremely important).  Arranges to provide checks in timely manner for large expenses, Syllabus and Lunch Fundraiser.  (Usually filled by Stake Financial Clerk.)\r\n',1,44,13,0);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (11,'Hall Monitor','The hall monitors wander the halls of the building and make themselves available to help participants find their classrooms, the bathrooms, etc. Hall monitors are usually missionaries.',0,100,3,0);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (12,'Registration Committee Member','Supports the Registration committee lead in assigned tasks.  May help assemble participant packets, may assist participants during registration, may support the registration lead with answering pre-registration questions.',0,90,3,1);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (13,'Information Committee Lead','Ensures that all information needs are met and that information flows smoothly and meets the needs of all committee members. Notes where there are issues for future improvement.',1,8,4,1);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (14,'Info - Graphics Designer','Designs posters, flyers, program cover, syllabus cover, and other graphic needs for the conference.  Ensures a consistent look for the conference - with consideration that program cover, syllabus cover and flyers will be printed in black and white.',0,130,4,0);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (15,'Info - Mailing List Coordinator','Ensures that contacts list in nefamilyhistory.com matches the mailing list in Mail Chimp.  Ensures that the Participants mailing list for a given year is maintained during the pre-registration period so that all participants get all messages.  Sends announcements to mailing lists using Mail Chimp as directed by the Committee Leadership.',0,150,4,0);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (16,'Info - Syllabus Coordinator','There are two parts to this role. It is recommended that the same person does both as the two need to be kept exactly the same. Having a single person do this reduces communications requirements.',0,160,4,0);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (17,'Info - WebMaster','Ensures the website is operating correctly, reports issues to the website programmer, turns on and off different aspects of the website at the direction of the committee leadership.  Provides 2nd Level (i.e., sub-committee leads are first level) technical Support for Website.',0,170,4,0);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (18,'Info - Web Base Report Writer','Creates standard and ad-hoc reports using ODBC connection to the web base.',0,180,4,0);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (19,'Info - Website Programmer','Adds functionality to the web application, www.nefamilyhistory.com, makes improvements to existing functionality.',0,190,4,0);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (20,'Info - Photographer','Documents the conference, attendance, speakers etc.',0,200,4,0);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (21,'Publicity Committee Lead','Works with conference web base and Information Committee and others to develop materials that both church and community leaders use to publicize the conference.',1,9,5,1);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (22,'Public Affairs Committee Lead','Ensures that local community is aware of the conference.',1,230,5,1);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (23,'Publicity Committee Member','Supports committee lead in assembling packages and distributing publicity materials.  Maybe a FH Consultant.',0,240,5,0);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (24,'FH Consultant Coordinator','Engages family history consultants stakewide to support the conference.',0,250,5,0);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (25,'Technical Committee Lead','Leads the Tech Sub-committee in - Setup of all technology needs for the day of the conference * Obtaining (borrowing/transporting) projectors * Running wiring * Audio where needed * Internet service (limited to speakers depending on bandwidth available) * Video recording - Assists Speakers on the day of the conference',1,10,6,1);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (26,'Tech Committee Member','Helps with setup of technology needs for the day of the conference including.',0,270,6,1);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (27,'Setup Committee Lead','Identifies volunteers to be Setup Helpers. Understands setup requirements. Assigns specific tasks to committee members. Directs setup committee during the 2-day setup period. Some cleaning maybe required of setup committee, bathrooms, vacuuming, etc.  Resources: Setup photographs and diagrams, General Signage Plan and laminated signs.',0,10,7,0);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (28,'Setup Committee Member','Follows direction of Setup Committee Lead during setup period from 2 days before the conference.',0,290,7,0);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (29,'Setup Decorations Coordinator','Decorates the dining tables and the speaker lounge.  ',0,300,7,0);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (30,'Parking Committee Lead','Arranges for parking on the day of the conference.  Ensures specific parking issues are resolved.',0,11,8,0);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (31,'Parking Committee Member','Guides vehicle drivers in where to park.',0,320,8,0);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (32,'Lunch Lead','Each year a specific ward is chosen to use the conference lunch preparation as a fundraiser for the youth of the ward.  The Lunch Lead works with specific ward youth to plan, purchase, assemble and distribute a packed lunch for all participants, who purchased a lunch during pre-registration.  The lead is given a budget as determined by Conference Committee leadership.  Lunch is also provided for the speakers (free), the missionaries (free), the committee members are expected to pay for a lunch(committee members should be signed up as participants so that their lunches can be counted).  See below, (under Design Lunch Menu task) very detailed write-up of how to put the lunch fundraiser together.',0,330,9,1);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (33,'Networking Refreshments Caterer','Plans, purchases and arranges refreshments for networking session at the end of the conference within budget as determined by Conference Committee leadership.\r\n\r\nCould be done by same person as speaker lounge catering, but split because they happen at opposite ends of the day.',0,340,9,0);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (34,'Clean-up Committee Lead','Identifies volunteers to be Cleanup Helpers. Understands cleanup requirements. Assigns specific tasks to committee members. Directs setup committee during cleanup after the conference. All reusable signs to be returned to FHC Closet.',0,12,10,0);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (35,'Clean Up Committee Member','The cleanup helper follows the direction of the Clean Up Lead. Cleanup helpers may be needed before the conference to prepare the rooms as well as after the conference.',0,360,10,0);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (36,'Info - Conduct Conference Evaluations','Develop, distribute, analyse results and present feedback from conference participants and committee members.',0,210,4,0);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (37,'PARTICIPANT','',0,110,3,NULL);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (38,'Food Committee Lead','Ensures that the Lunch Lead and the Networking Refreshments coordinator understand their roles.  May play the role of speaker lounge caterer or delegate.  Ensures there is adequate water for breaks.  Interfaces with leadership if there are any issues.',1,6,9,1);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (42,'Program Committee Lead','Ensures the program is balanced between meeting the needs of the church members and community members.  Provides variety within a particular conference and over one conference to another.',1,4,11,1);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (40,'Program Committee Member','Assists in the development of the program.  Researches new speakers.  Engages the speaker and works with them to clarify their topic.  Captures information about the speakers and their presentations in the web application.  www.nefamilyhistory.com .  Hands off speaker to Speaker Host once the speaker and presentation information are complete in the web base.',0,40,11,1);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (43,'Speaker Lounge Caterer','Purchases and displays snacks for the speakers in the speaker lounge.  \r\n\r\nCould be done by same person as networking session catering, but split because they happen at opposite ends of the day.',0,43,9,0);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (45,'Cashier','Collects cash and checks for items (extra syllabus or lunch) paid for on the day of the conference.  Keeps a list of what was paid for and how much.  Extra syllabus and lunches.  Should be a priesthood holder.  Needs to be at the conference early and through registration and then again at the end of the day to reconcile the money collected.',1,45,13,1);
INSERT INTO `committee_roles` (`id`, `role_name`, `description`, `calling_required`, `seq_no`, `committee_committee_id`, `name_tag_needed`) VALUES (46,'Other Fund Raiser Lead','Leads any fund raiser in addition to the Lunch Fund raiser.  Examples are cupcakes with faces, cinnamon rolls, Easter cookies, etc.  Usually a Young Womens group leader from Franklin 1st Ward or 2nd Branch.',0,46,9,1);
/*!40000 ALTER TABLE `committee_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `committees`
--

DROP TABLE IF EXISTS `committees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `committees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `seq_no` int(11) DEFAULT NULL,
  `oversight_role_assignment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_committees_co_chair_role_assignment_id` (`oversight_role_assignment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `committees`
--

LOCK TABLES `committees` WRITE;
/*!40000 ALTER TABLE `committees` DISABLE KEYS */;
INSERT INTO `committees` (`id`, `code`, `name`, `description`, `seq_no`, `oversight_role_assignment_id`) VALUES (1,'LEAD','Leadership Committee','Creates the organization that will create the conference.  Provides oversight of the process of creating the conference, resolves issues for committee leads.  Ensures that key tasks and milestones are being met.  Interfaces with stake presidency and high council for support and ensures they are aware of issues beyond the control of the Leadership Committee.',1,6);
INSERT INTO `committees` (`id`, `code`, `name`, `description`, `seq_no`, `oversight_role_assignment_id`) VALUES (2,'HOST','Host Committee','Hosts the speaker on the day of the conference.  Arranges for lodging and transportation for speakers from out of town.  Conveys speaker requirements to setup committee.',4,17);
INSERT INTO `committees` (`id`, `code`, `name`, `description`, `seq_no`, `oversight_role_assignment_id`) VALUES (3,'REG','Registration Committee','Provides customer service for participants.  Monitors pre-registration process.  Registers all participants, including walk-ins, on the day of the conference.  Resolves participant issues regarding registration during pre-registration and on the day of the conference. Conveys registration specific setup requirements to setup committee.',3,19);
INSERT INTO `committees` (`id`, `code`, `name`, `description`, `seq_no`, `oversight_role_assignment_id`) VALUES (4,'INFO','Information Committee','Provides information support for all committees.  Administers and develops web application.',8,19);
INSERT INTO `committees` (`id`, `code`, `name`, `description`, `seq_no`, `oversight_role_assignment_id`) VALUES (5,'PUB','Publicity Committee Lead','Ensures that church and community leaders and institutions (e.g. libraries, genealogical societies, etc.) have what they need to publicize the conference.',6,19);
INSERT INTO `committees` (`id`, `code`, `name`, `description`, `seq_no`, `oversight_role_assignment_id`) VALUES (6,'TECH','Technical Committee','Ensures that audio-visual, internet and communications equipment is installed and tested.',7,19);
INSERT INTO `committees` (`id`, `code`, `name`, `description`, `seq_no`, `oversight_role_assignment_id`) VALUES (7,'SETUP','Setup Committee','Ensures the classroom setup meets the needs of the participants and the speakers.  Interfaces with Registration and Speaker Committees for specific requirements.',9,19);
INSERT INTO `committees` (`id`, `code`, `name`, `description`, `seq_no`, `oversight_role_assignment_id`) VALUES (8,'PARK','Parking Committee','Ensures that all vehicles are parked in safe positions and that efficient use is made of the parking area.',10,17);
INSERT INTO `committees` (`id`, `code`, `name`, `description`, `seq_no`, `oversight_role_assignment_id`) VALUES (9,'FOOD','Food Committee','Purchases, prepares and displays food and drink for the day of the conference.  This includes the fund raisers (lunch and other), the networking refreshments, catering of the speaker lounge , any other fund raiser and provides bottled water for the breaks.',5,17);
INSERT INTO `committees` (`id`, `code`, `name`, `description`, `seq_no`, `oversight_role_assignment_id`) VALUES (10,'CLEAN','Clean-up Committee','Ensures that the building is clean for Sunday meetings the day after the conference.',11,17);
INSERT INTO `committees` (`id`, `code`, `name`, `description`, `seq_no`, `oversight_role_assignment_id`) VALUES (11,'PROG','Program Committee','Engages the speakers and ensures that all information, pertaining to the speakers and their presentations, is correct in the web base in preparation for pre-registration.  ',2,17);
INSERT INTO `committees` (`id`, `code`, `name`, `description`, `seq_no`, `oversight_role_assignment_id`) VALUES (13,'ACCT','Accounting Committee','Collects and records participant payments as they arrive.  Reconciles accounts.  Reimburses for expenses incurred by committee members.  Reimburses syllabus coordinator ~$1200. Reimburses Lunch Fundraiser ~$800.',13,20);
/*!40000 ALTER TABLE `committees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `doc_file` mediumtext COLLATE utf8_unicode_ci,
  `seq_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` (`id`, `name`, `description`, `doc_file`, `seq_no`) VALUES (1,'Email Forwarding','We have a google email account that is used for the participants to communicate with use during registration and for any other purpose.  Generally, the email is forwarded to one of the co-chairs until pre-registration starts.  Once pre-registrations starts, the email will either be forwarded to the registration lead(s) or they will periodically check the messages.','{doc:EmailForwarding.pdf}',1);
INSERT INTO `documents` (`id`, `name`, `description`, `doc_file`, `seq_no`) VALUES (2,'Stake Expense Report Form','Form used by committee members to report expenses for the conference.','{doc:ExpenseForm.pdf}',28);
INSERT INTO `documents` (`id`, `name`, `description`, `doc_file`, `seq_no`) VALUES (3,'How to cancel registration but keep contact info','','{doc: Howtocancelregistrationbutkeepcontactinfo.pdf}',22);
INSERT INTO `documents` (`id`, `name`, `description`, `doc_file`, `seq_no`) VALUES (4,'OUTofDATE: How to print the Participant Conference Schedules','','{doc:PrintingParticipantConferenceSchedulesinBatch.pdf}',25);
INSERT INTO `documents` (`id`, `name`, `description`, `doc_file`, `seq_no`) VALUES (5,'Managing the Contacts List','','{doc:MANAGINGOURCONTACTSLIST.pdf}',22);
INSERT INTO `documents` (`id`, `name`, `description`, `doc_file`, `seq_no`) VALUES (8,'Processing Payments','Logs all payments in the www.nefamilyhistory.com web base and indicates which participants are covered by each check.','{doc:processingPayments.pdf}',20);
INSERT INTO `documents` (`id`, `name`, `description`, `doc_file`, `seq_no`) VALUES (9,'Working with the Presentation Schedule','This function allows the user to select a track and session for a presentation.  It also allows the user to select the room for the presentation.','{doc:WorkingwiththePresentationSchedule.pdf}',14);
INSERT INTO `documents` (`id`, `name`, `description`, `doc_file`, `seq_no`) VALUES (10,'Changing the Info on the Public Main Page of the Website','The main page is the first page that anyone approaching the website sees.  It has all the general information that someone would need to decide if they want to come to the conference.  (Includes how to update the menu.)','{doc: ThePublicMainPageoftheWebsiteTheEventrecord.pdf}',2);
INSERT INTO `documents` (`id`, `name`, `description`, `doc_file`, `seq_no`) VALUES (11,'General Signage Plan','A map of the building showing where each general sign should go and how it should be displayed.','{doc:GenSignPlan.doc}',11);
INSERT INTO `documents` (`id`, `name`, `description`, `doc_file`, `seq_no`) VALUES (12,'Speaker Engagement Script','Document that lists the important things that the speaker host needs to discuss with the speaker as part of engaging the speaker to present at the conference.','{doc:SpeakerEngageScript.doc}',13);
INSERT INTO `documents` (`id`, `name`, `description`, `doc_file`, `seq_no`) VALUES (13,'What goes in the Speaker Packet?','* Lunch Ticket\r\n* Class Schedule specific to Speaker\r\n* 8 1/2 x 11 map of the building (highlights for whare they will be teaching and where the nearest bathroom is)\r\n* Name Tag\r\n* Program\r\n* Syllabus (if they want one)',NULL,14);
INSERT INTO `documents` (`id`, `name`, `description`, `doc_file`, `seq_no`) VALUES (14,'Public Libraries - Rhode Island','Listing of public libraries in Rhode Island with contact info, includes email addresses for most.','{doc:RIPubLibs.xls}',15);
INSERT INTO `documents` (`id`, `name`, `description`, `doc_file`, `seq_no`) VALUES (15,'Walk-in Registration Form','For participants who arrive at the conference having not pre-registered, they will fill out the walk-in form.','{doc:WalkinForm.doc}',16);
INSERT INTO `documents` (`id`, `name`, `description`, `doc_file`, `seq_no`) VALUES (16,'Name Tags','Template docs for creating Name Tags\r\n\r\nSpeakers\r\nCommittee\r\nParticipants','{doc:SpeakerNameTags.doc},{doc:CommitteeNameTags.doc},{doc:ParticpantNameTags.doc}',17);
INSERT INTO `documents` (`id`, `name`, `description`, `doc_file`, `seq_no`) VALUES (17,'Host Duties',NULL,'{doc:host_duties.doc}',18);
INSERT INTO `documents` (`id`, `name`, `description`, `doc_file`, `seq_no`) VALUES (18,'Key Tasks and their Dependencies','Diagram showing the critical handoffs and the timeframes for completing key tasks.','{doc:Key_Tasks_And_Dependencies.xls}',0);
INSERT INTO `documents` (`id`, `name`, `description`, `doc_file`, `seq_no`) VALUES (20,'Flyer (Example from 2013)','','{doc:FlyerFrontPage.pdf},{doc:FlyerBackPage.xls}',20);
INSERT INTO `documents` (`id`, `name`, `description`, `doc_file`, `seq_no`) VALUES (21,'Participant List for Registration (Example from 2013)','List of participants for use by the registration leads for tracking purposes on the day of the conference.  Includes the following information:\r\n\r\nParticipant Full Name\r\nEmail Address\r\nSyllabus (number of syllabus ordered)\r\nSandwich\r\nLDS Member (1= yes, 0= no)\r\nPaid with Check: if so, check nu appears\r\nNotes: blank for use by registration leads','{doc:ParticipantRegList.xls}',21);
INSERT INTO `documents` (`id`, `name`, `description`, `doc_file`, `seq_no`) VALUES (22,'Name Tag Template - Speaker','Word Template used in the Merge process to create the name tag file.','{doc:NameTagTemplate-Speaker.doc}',22);
INSERT INTO `documents` (`id`, `name`, `description`, `doc_file`, `seq_no`) VALUES (23,'Building Map','Diagram of the building showing each classroom, the bathrooms, the speaker lounge, etc.','{doc:buildingmap.jpg}',23);
INSERT INTO `documents` (`id`, `name`, `description`, `doc_file`, `seq_no`) VALUES (25,'How to create the syllabus (Paper & Downloadable)','Instructions on how to put the syllabus together using Microsoft Word.  Also has instructions for creating the PDFs and loading them into the website.','{doc:HowToCreateSyllabus.doc}',25);
INSERT INTO `documents` (`id`, `name`, `description`, `doc_file`, `seq_no`) VALUES (26,'List of Area Newspapers','Contact information for newspapers in which we might place a press release or which might do an article about the conference.','{doc:AreaNewspaperList.xls}',26);
INSERT INTO `documents` (`id`, `name`, `description`, `doc_file`, `seq_no`) VALUES (27,'List of Transportation/Lodging Providers','List of church members and others willing to provide lodging or transportation, e.g., to and/or from the airport.','',27);
INSERT INTO `documents` (`id`, `name`, `description`, `doc_file`, `seq_no`) VALUES (28,'Building Cleaning Checklist','List of areas of the building and details of what to do to clean it in preparation for Sunday meetings.','{doc:BuildCleanCheckList.doc}',28);
INSERT INTO `documents` (`id`, `name`, `description`, `doc_file`, `seq_no`) VALUES (29,'Lunch Fundraiser ','A detailed explanation of how to put together the Lunch for the conference.  This was developed by Sr. Howe for the 2012 conference and was used successfully for the 2013 lunch.','{doc:LunchFundraiser.pdf}',29);
INSERT INTO `documents` (`id`, `name`, `description`, `doc_file`, `seq_no`) VALUES (30,'Program (Example from 2013)','Includes:\r\n\r\n1. Schedule of the day, opening session, classes, etc.\r\n2. Map of the building with letters indicating the key classrooms.\r\n3. Announcements\r\n','{doc:program.doc}',30);
INSERT INTO `documents` (`id`, `name`, `description`, `doc_file`, `seq_no`) VALUES (31,'Directions for Adding a Walk-in','Document divided into 6 each with instructions for those registration committee members assigned to help the walk-ins register.  Registration Lead will add the person\'s login information at the bottom of each card.','{doc:WalkinDirections.doc}',31);
INSERT INTO `documents` (`id`, `name`, `description`, `doc_file`, `seq_no`) VALUES (32,'Evaluation Results Examples - 2013','Documents that contain the summaries of the evaluation results from the participants, speakers and committee members.','{doc:2013-Participant_Results.doc},{doc:2013-Speaker_Results.doc},{doc:2013-Committee_Results.doc}',32);
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) DEFAULT NULL,
  `objectives` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` (`id`, `year`, `objectives`) VALUES (1,2005,NULL);
INSERT INTO `events` (`id`, `year`, `objectives`) VALUES (2,2006,'Support the churches objective to be a good citizen of Franklin and get to know the community.  Encourage community members, especially Franklin, to come to the conference.');
INSERT INTO `events` (`id`, `year`, `objectives`) VALUES (3,2007,'Support the churches objective to be a good citizen of Franklin and get to know the community. Encourage community members, especially Franklin, to come to the conference.');
INSERT INTO `events` (`id`, `year`, `objectives`) VALUES (4,2008,'Unknown');
INSERT INTO `events` (`id`, `year`, `objectives`) VALUES (5,2009,'Unknown');
INSERT INTO `events` (`id`, `year`, `objectives`) VALUES (6,2010,'Unknown');
INSERT INTO `events` (`id`, `year`, `objectives`) VALUES (7,2011,'Unknown');
INSERT INTO `events` (`id`, `year`, `objectives`) VALUES (8,2012,'Increase the number of LDS members that participate in the conference.');
INSERT INTO `events` (`id`, `year`, `objectives`) VALUES (9,2013,'Increase the number of LDS members that participate in the conference.');
INSERT INTO `events` (`id`, `year`, `objectives`) VALUES (10,2014,'1. Increase the number of LDS members that participate in the conference.');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings`
--

DROP TABLE IF EXISTS `meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `purpose` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `agenda` mediumtext COLLATE utf8_unicode_ci,
  `month_week` int(11) DEFAULT NULL,
  `month_month_id` int(11) DEFAULT NULL,
  `seq_no` int(11) DEFAULT NULL,
  `facilitator_committee_role_id` int(11) DEFAULT NULL,
  `notes` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `fk_meetings_facilitator_committee_role_id` (`facilitator_committee_role_id`),
  KEY `fk_meetings_month_month_id` (`month_month_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings`
--

LOCK TABLES `meetings` WRITE;
/*!40000 ALTER TABLE `meetings` DISABLE KEYS */;
INSERT INTO `meetings` (`id`, `name`, `purpose`, `agenda`, `month_week`, `month_month_id`, `seq_no`, `facilitator_committee_role_id`, `notes`) VALUES (1,'Lessons Learned','To review feedback from all constituents and set objectives for the following year.','1. Present feedback from participants.\r\n2. Present feedback from speakers.\r\n3. Present feedback from committee members.\r\n4. Brainstorm ideas for following year.\r\n5. Identify objectives for following year.\r\n\r\nParking, Setup and Cleanup Leads are optional for this meeting.  Other committee members may be invited, but only the leads are required to attend.\r\n\r\nThis meeting should be conducted as a face-to-face meeting.',2,2,1,3,NULL);
INSERT INTO `meetings` (`id`, `name`, `purpose`, `agenda`, `month_week`, `month_month_id`, `seq_no`, `facilitator_committee_role_id`, `notes`) VALUES (2,'Conference Committee Orientation','To orient committee members to how the conference planning process works.','1. Introductions\r\n2. Review high level plan (key tasks and handoffs)\r\n3. Establish group norms regarding communication etc.\r\n4. Establish meeting schedule\r\n\r\n',1,4,4,3,'This meeting should be conducted face-to-face.');
INSERT INTO `meetings` (`id`, `name`, `purpose`, `agenda`, `month_week`, `month_month_id`, `seq_no`, `facilitator_committee_role_id`, `notes`) VALUES (3,'Sub-committee Leadership Handoff Meeting','To train new sub-committee lead on duties for the role.','1. Review tasks\r\n2. Review hand-offs to other committees (where applicable) and timeframes to keep in mind, i.e., deadlines (where applicable)\r\n3. Review pertinent aspects of the web application.\r\n4. Review resources, documents and other support materials.\r\n\r\nThese meetings should be conducted so that both parties can share a computer screen.',2,4,5,NULL,'Separate 1-on-1 meetings will be held between the new sub-committee lead and the prior sub-commitee lead.');
INSERT INTO `meetings` (`id`, `name`, `purpose`, `agenda`, `month_week`, `month_month_id`, `seq_no`, `facilitator_committee_role_id`, `notes`) VALUES (4,'Co-chair Alignment Meeting','To agree on how to share the work.','One on one meeting between the two new co-chairs to discuss their preferences in breaking down the work.\r\n\r\n',3,2,2,3,'This meeting should be conducted face-to-face.');
INSERT INTO `meetings` (`id`, `name`, `purpose`, `agenda`, `month_week`, `month_month_id`, `seq_no`, `facilitator_committee_role_id`, `notes`) VALUES (5,'Program Framing Meeting','To make sure there is balance in the overall program regarding topics, countries, etc.','1. Review program related feedback from the evaluations.\r\n2. Review program related objectives.\r\n3. Identify topics to be addressed at next conference.\r\n3. Review list of speakers willing to speak again.\r\n4. Review list of desired speakers not contacted yet.\r\n5. Assign tasks to identify new speakers to fill unfulfilled topics.\r\n6. Assign tasks to contact prior speakers.\r\n\r\n',1,3,6,42,'The Executive Sponsor is an optional attendee for this meeting.\r\n\r\nThis meeting should be conducted face-to-face.');
INSERT INTO `meetings` (`id`, `name`, `purpose`, `agenda`, `month_week`, `month_month_id`, `seq_no`, `facilitator_committee_role_id`, `notes`) VALUES (6,'High Level Planning Meeting','To ensure alignment with stake leadership and communicate organizational needs.','1. Review feedback from Lessons Learned meeting.\r\n2. Agree on objectives for next conference.\r\n3. Co-chairs make calling requests, may or may not include a suggested person for the role(s).\r\n4. Discuss any major changes for next conference and implications.\r\n5. Discuss budget.\r\n\r\nThis meeting should be conducted face-to-face.',4,2,2,3,'');
INSERT INTO `meetings` (`id`, `name`, `purpose`, `agenda`, `month_week`, `month_month_id`, `seq_no`, `facilitator_committee_role_id`, `notes`) VALUES (7,'Program Finalization','To present the program to the leadership and confirm is it complete.','1. Present the program\r\n2. Present the Roadshow\r\n3. Discussion\r\n\r\n',4,7,8,40,'This meeting maybe conducted as a conference call with screen sharing.');
INSERT INTO `meetings` (`id`, `name`, `purpose`, `agenda`, `month_week`, `month_month_id`, `seq_no`, `facilitator_committee_role_id`, `notes`) VALUES (8,'Program Status Meeting','To ensure that those involved in developing the website content are on track.','Status is presented on tasks listed below.  There may be a need for several meetings like this one.  \r\n\r\n',4,7,7,42,'This meeting can be conducted as a conference call with screen sharing.');
INSERT INTO `meetings` (`id`, `name`, `purpose`, `agenda`, `month_week`, `month_month_id`, `seq_no`, `facilitator_committee_role_id`, `notes`) VALUES (9,'Participant Packet Assembly Party','To stuff the participant envelopes.','The following should be included in the envelope:\r\n\r\nName Tag (paperclipped on outside)\r\nParticipant Individual Schedule\r\nSyllabus (if ordered and paid for)\r\nLunch Ticket (if ordered and paid for)',4,12,12,9,'');
INSERT INTO `meetings` (`id`, `name`, `purpose`, `agenda`, `month_week`, `month_month_id`, `seq_no`, `facilitator_committee_role_id`, `notes`) VALUES (10,'Parking Sub-committee Meeting','To explain their role to parking committee members ','Get together to make sure all parking team members understand what they need to do.',4,12,19,30,'This meeting can be done on the day of the conference.');
INSERT INTO `meetings` (`id`, `name`, `purpose`, `agenda`, `month_week`, `month_month_id`, `seq_no`, `facilitator_committee_role_id`, `notes`) VALUES (11,'Publicity Kick-off Meeting','To review the status of efforts to notify the community and the members.','1. Discuss publicity objectives.\r\n2. Review lists of organizations to be notified.\r\n3. Review contents of each type of packet.\r\n4. Discuss notification of membership, our stake, other New England stakes?',1,8,9,21,'');
INSERT INTO `meetings` (`id`, `name`, `purpose`, `agenda`, `month_week`, `month_month_id`, `seq_no`, `facilitator_committee_role_id`, `notes`) VALUES (12,'Publicity Status Meeting','To provide leadership support for publicity efforts.','1. Review what has been done.\r\n2. Discuss issues.\r\n',2,10,10,21,'This meeting can be conducted as a conference call.\r\nOnly the co-chair responsible for oversight of publicity need attend this meeting.');
INSERT INTO `meetings` (`id`, `name`, `purpose`, `agenda`, `month_week`, `month_month_id`, `seq_no`, `facilitator_committee_role_id`, `notes`) VALUES (13,'Setup Planning Meeting','To ensure that plans are in place to make the setup process go smoothly','1. Review setup materials.\r\n2. Determine number of setup team members needed.\r\n',1,11,16,27,'');
INSERT INTO `meetings` (`id`, `name`, `purpose`, `agenda`, `month_week`, `month_month_id`, `seq_no`, `facilitator_committee_role_id`, `notes`) VALUES (14,'Soft Setup (Friday)','To put the finishing touches on making the building look beautiful for conference day.','Once the furniture has all been moved into place during \"Hard Setup\" on the Thursday before the conference, \"Soft Setup\" can take place on the Friday.  Decorations, participant packets, speaker host packets and gifts are carefully place to maximize efficiency and convenience for all.  The technology team runs extension cords so that power is available in the center of the cultural hall, screens are setup and projectors mounted in place.',4,12,18,3,'');
INSERT INTO `meetings` (`id`, `name`, `purpose`, `agenda`, `month_week`, `month_month_id`, `seq_no`, `facilitator_committee_role_id`, `notes`) VALUES (15,'Hard Setup (Thursday)','All activities involving moving furniture','1. Stand-up meeting to agree on how the work will be broken down (if it has not already been communicated).\r\n2. Setup furniture as directed. \r\n',4,12,17,27,'See hard copy Setup Book as referenced below for diagrams, photographs and instructions.');
INSERT INTO `meetings` (`id`, `name`, `purpose`, `agenda`, `month_week`, `month_month_id`, `seq_no`, `facilitator_committee_role_id`, `notes`) VALUES (16,'Conference Day Preparation','To ensure that all committees are ready for conference day.','Here is partial list, in no particular order, of what is typically discussed at these meetings:\r\n\r\nSpeaker Gift\r\nClarification of the Lunch and Syllabus numbers\r\nStatistics or other information needed for the talks\r\nThe Opening session\r\nSpecial Needs for particular participants\r\nDecorations - where are the tablecloths?\r\nTechnical Needs\r\nSpecial Needs for the speakers\r\nThe program - special requirements, e.g, in memoriam\r\n',3,11,15,3,'If the committee organization works as intended, there should be less of a reliance on these meetings, but there are inevitable last minute needs.  There may be several of these meetings.  Invitees should be kept to a minimum, i.e., committee leads unless there are extenuating circumstances.  Committee leads should send a substitute if they can\'t make the meeting.  These meetings can be conducted on a conference call and should be kept short.  \r\n\r\nAt the last meeting, the Info committee peson responsible for the Participant Evaluation should be included and given any requests for special questions for the Evaluation.\r\n\r\nThe Info report writer may be called on to provide statistics or a special report from the web base.');
INSERT INTO `meetings` (`id`, `name`, `purpose`, `agenda`, `month_week`, `month_month_id`, `seq_no`, `facilitator_committee_role_id`, `notes`) VALUES (17,'Host Sub-committee Meeting','To confirm that all committee tasks will be completed effectively.','1. Review tasks.\r\n2. Ensure that a committee member is assigned to each task.\r\n3. Discuss the tasks and any issues.',1,10,14,5,'There may be several of these meetings as needed.  It is recommended that the first of these meetings be conducted in person, but follow on meetings may be done as a conference call.');
INSERT INTO `meetings` (`id`, `name`, `purpose`, `agenda`, `month_week`, `month_month_id`, `seq_no`, `facilitator_committee_role_id`, `notes`) VALUES (18,'Food Sub-committee Meeting','To confirm that all committee tasks will be completed effectively.','1. Review tasks.\r\n2. Ensure that a committee member is assigned to each task and that the committee member knows the resources that are available.\r\n3. Discuss the tasks and any issues that have been identified.\r\netc.',3,7,13,38,'There may be several of these meetings as needed.  It is recommended that the first of these meetings be conducted in person, but follow on meetings may be done as a conference call.');
INSERT INTO `meetings` (`id`, `name`, `purpose`, `agenda`, `month_week`, `month_month_id`, `seq_no`, `facilitator_committee_role_id`, `notes`) VALUES (19,'Registration Sub-committee Meeting','To confirm that all committee tasks will be completed effectively.','1. Review tasks.\r\n2. Ensure that a committee member is assigned to each task.\r\n3. Discuss the tasks and any issues that have been identified.\r\netc.',1,10,11,9,'There may be several of these meetings as needed.  It is recommended that the first of these meetings be conducted in person, but follow on meetings may be done as a conference call.  The hall monitors (usually missionaries) need not be at all of these meetings in advance of the conference.');
INSERT INTO `meetings` (`id`, `name`, `purpose`, `agenda`, `month_week`, `month_month_id`, `seq_no`, `facilitator_committee_role_id`, `notes`) VALUES (21,'Financial Reconciliation','To ensure that cash and checks collected on conference day are appropriately handled.','1. Ensure that cash and checks collected on conference day are handled in accordance with church policies.\r\n2. Determine final amount to be paid to youth group responsible for Lunch Fund Raiser.\r\n3. Collect reimbursement forms from other committee members.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n',4,12,21,44,'This meeting needs to be held at the end of the day on conference day.  Ideally, deposit will be made on the day of the conference.');
/*!40000 ALTER TABLE `meetings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings_invitees_committee_roles`
--

DROP TABLE IF EXISTS `meetings_invitees_committee_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings_invitees_committee_roles` (
  `committee_role_dest_id` int(11) NOT NULL DEFAULT '0',
  `meeting_src_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`committee_role_dest_id`,`meeting_src_id`),
  KEY `fk_meetings_invitees_committee_roles_sid` (`meeting_src_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings_invitees_committee_roles`
--

LOCK TABLES `meetings_invitees_committee_roles` WRITE;
/*!40000 ALTER TABLE `meetings_invitees_committee_roles` DISABLE KEYS */;
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (1,1);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (1,5);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (1,6);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (1,7);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (1,11);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (1,12);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (2,1);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (2,5);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (2,6);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (2,7);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (2,11);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (2,12);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (2,13);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (2,16);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (2,17);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (2,21);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (3,1);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (3,2);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (3,4);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (3,5);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (3,6);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (3,7);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (3,8);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (3,11);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (3,12);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (3,13);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (3,15);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (3,16);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (5,1);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (5,2);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (5,7);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (5,8);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (5,13);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (5,16);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (5,17);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (6,17);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (8,17);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (9,1);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (9,2);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (9,9);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (9,13);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (9,14);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (9,16);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (9,19);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (11,19);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (12,9);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (12,14);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (12,19);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (13,1);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (13,2);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (13,7);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (13,16);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (18,16);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (21,1);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (21,2);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (21,11);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (21,12);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (22,11);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (22,12);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (23,11);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (25,1);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (25,2);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (25,13);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (25,15);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (25,16);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (26,15);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (27,1);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (27,13);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (27,14);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (27,15);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (27,16);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (28,13);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (28,15);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (29,13);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (29,16);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (30,1);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (30,10);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (30,16);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (31,10);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (32,2);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (32,16);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (33,16);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (34,1);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (34,13);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (34,16);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (35,13);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (36,16);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (38,2);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (38,13);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (38,16);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (38,18);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (40,5);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (40,7);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (40,8);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (43,18);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (44,3);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (44,16);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (44,21);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (45,16);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (45,19);
INSERT INTO `meetings_invitees_committee_roles` (`committee_role_dest_id`, `meeting_src_id`) VALUES (45,21);
/*!40000 ALTER TABLE `meetings_invitees_committee_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings_resources_resources`
--

DROP TABLE IF EXISTS `meetings_resources_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings_resources_resources` (
  `resource_dest_id` int(11) NOT NULL DEFAULT '0',
  `meeting_src_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`resource_dest_id`,`meeting_src_id`),
  KEY `fk_meetings_resources_resources_sid` (`meeting_src_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings_resources_resources`
--

LOCK TABLES `meetings_resources_resources` WRITE;
/*!40000 ALTER TABLE `meetings_resources_resources` DISABLE KEYS */;
INSERT INTO `meetings_resources_resources` (`resource_dest_id`, `meeting_src_id`) VALUES (6,9);
INSERT INTO `meetings_resources_resources` (`resource_dest_id`, `meeting_src_id`) VALUES (7,16);
INSERT INTO `meetings_resources_resources` (`resource_dest_id`, `meeting_src_id`) VALUES (8,3);
INSERT INTO `meetings_resources_resources` (`resource_dest_id`, `meeting_src_id`) VALUES (8,7);
INSERT INTO `meetings_resources_resources` (`resource_dest_id`, `meeting_src_id`) VALUES (8,8);
INSERT INTO `meetings_resources_resources` (`resource_dest_id`, `meeting_src_id`) VALUES (8,16);
INSERT INTO `meetings_resources_resources` (`resource_dest_id`, `meeting_src_id`) VALUES (9,3);
INSERT INTO `meetings_resources_resources` (`resource_dest_id`, `meeting_src_id`) VALUES (9,7);
INSERT INTO `meetings_resources_resources` (`resource_dest_id`, `meeting_src_id`) VALUES (9,8);
INSERT INTO `meetings_resources_resources` (`resource_dest_id`, `meeting_src_id`) VALUES (9,16);
INSERT INTO `meetings_resources_resources` (`resource_dest_id`, `meeting_src_id`) VALUES (10,9);
INSERT INTO `meetings_resources_resources` (`resource_dest_id`, `meeting_src_id`) VALUES (11,9);
INSERT INTO `meetings_resources_resources` (`resource_dest_id`, `meeting_src_id`) VALUES (12,9);
INSERT INTO `meetings_resources_resources` (`resource_dest_id`, `meeting_src_id`) VALUES (12,19);
INSERT INTO `meetings_resources_resources` (`resource_dest_id`, `meeting_src_id`) VALUES (14,13);
INSERT INTO `meetings_resources_resources` (`resource_dest_id`, `meeting_src_id`) VALUES (14,14);
INSERT INTO `meetings_resources_resources` (`resource_dest_id`, `meeting_src_id`) VALUES (14,15);
INSERT INTO `meetings_resources_resources` (`resource_dest_id`, `meeting_src_id`) VALUES (14,19);
INSERT INTO `meetings_resources_resources` (`resource_dest_id`, `meeting_src_id`) VALUES (16,14);
INSERT INTO `meetings_resources_resources` (`resource_dest_id`, `meeting_src_id`) VALUES (16,19);
INSERT INTO `meetings_resources_resources` (`resource_dest_id`, `meeting_src_id`) VALUES (17,14);
INSERT INTO `meetings_resources_resources` (`resource_dest_id`, `meeting_src_id`) VALUES (18,1);
INSERT INTO `meetings_resources_resources` (`resource_dest_id`, `meeting_src_id`) VALUES (18,6);
INSERT INTO `meetings_resources_resources` (`resource_dest_id`, `meeting_src_id`) VALUES (19,11);
INSERT INTO `meetings_resources_resources` (`resource_dest_id`, `meeting_src_id`) VALUES (20,2);
INSERT INTO `meetings_resources_resources` (`resource_dest_id`, `meeting_src_id`) VALUES (22,21);
INSERT INTO `meetings_resources_resources` (`resource_dest_id`, `meeting_src_id`) VALUES (25,17);
/*!40000 ALTER TABLE `meetings_resources_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `months`
--

DROP TABLE IF EXISTS `months`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `months` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seq_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `months`
--

LOCK TABLES `months` WRITE;
/*!40000 ALTER TABLE `months` DISABLE KEYS */;
INSERT INTO `months` (`id`, `code`, `description`, `seq_no`) VALUES (1,'APR','April',1);
INSERT INTO `months` (`id`, `code`, `description`, `seq_no`) VALUES (2,'MAY','May',2);
INSERT INTO `months` (`id`, `code`, `description`, `seq_no`) VALUES (3,'JUN','June',3);
INSERT INTO `months` (`id`, `code`, `description`, `seq_no`) VALUES (4,'JUL','July',4);
INSERT INTO `months` (`id`, `code`, `description`, `seq_no`) VALUES (5,'AUG','August',5);
INSERT INTO `months` (`id`, `code`, `description`, `seq_no`) VALUES (6,'SEP','September',6);
INSERT INTO `months` (`id`, `code`, `description`, `seq_no`) VALUES (7,'OCT','October',7);
INSERT INTO `months` (`id`, `code`, `description`, `seq_no`) VALUES (8,'NOV','November',8);
INSERT INTO `months` (`id`, `code`, `description`, `seq_no`) VALUES (9,'DEC','December',9);
INSERT INTO `months` (`id`, `code`, `description`, `seq_no`) VALUES (10,'JAN','January',10);
INSERT INTO `months` (`id`, `code`, `description`, `seq_no`) VALUES (11,'FEB','February',11);
INSERT INTO `months` (`id`, `code`, `description`, `seq_no`) VALUES (12,'MAR','March',12);
/*!40000 ALTER TABLE `months` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `query` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `picture` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doc_file` mediumtext COLLATE utf8_unicode_ci,
  `link` mediumtext COLLATE utf8_unicode_ci,
  `seq_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources`
--

LOCK TABLES `resources` WRITE;
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
INSERT INTO `resources` (`id`, `name`, `description`, `picture`, `doc_file`, `link`, `seq_no`) VALUES (1,'Survey Monkey','Survey Monkey is a low cost cloud based survey tool that we use to capture feedback from the participants.\r\n\r\nUsername: nefamilyhistory\r\npassword: genealogy','resource_picture_1.jpg','','http://www.surveymonkey.com/',19);
INSERT INTO `resources` (`id`, `name`, `description`, `picture`, `doc_file`, `link`, `seq_no`) VALUES (2,'Mail Chimp','Mail Chimp is a free (12000 message to up to 2000 members /month) cloud based application that we use to send bulk emails.  The option avoids all the spam filters that regular email providers apply which disable us from sending bulk emails.\r\n\r\nusername: nefamilyhistory@gmail.com\r\npassword: genealogy537','resource_picture_2.jpg','','http://mailchimp.com/?utm_expid=62800740-12',2);
INSERT INTO `resources` (`id`, `name`, `description`, `picture`, `doc_file`, `link`, `seq_no`) VALUES (3,'Gmail Account','Participants and speakers use this email address to contact us about the conference.  Announcements to over 100 people are sent from Mail Chimp with this email as the return address.  Messages to smaller numbers of people can be sent directly from this account.  The account is monitored by the registration committee during pre-registration and for 2 weeks after the conference to ensure prompt responses to participant questions.\r\n\r\nOur account name is *nefamilyhistory@gmail.com*\r\n\r\nusername: nefamilyhistory\r\npassword: genealogy','resource_picture_3.jpg','','https://mail.google.com/mail/?shva=1#inbox',3);
INSERT INTO `resources` (`id`, `name`, `description`, `picture`, `doc_file`, `link`, `seq_no`) VALUES (4,'Past Year Syllabus','The Family History Center in the Franklin building has example syllabus books from most past years.','resource_picture_4.jpg','','',4);
INSERT INTO `resources` (`id`, `name`, `description`, `picture`, `doc_file`, `link`, `seq_no`) VALUES (5,'Committee Handbook','On-line help that describes each role, provides resources, documents and web application functions to support each role.','resource_picture_5.jpg','','http://www.applimatics.com:8089/',5);
INSERT INTO `resources` (`id`, `name`, `description`, `picture`, `doc_file`, `link`, `seq_no`) VALUES (6,'Name Tag Template - Speakers','MS Word Template used for creating the Speaker Name Tags','resource_picture_6.jpg','{doc:Name TagTemplate-Speaker.doc}','',6);
INSERT INTO `resources` (`id`, `name`, `description`, `picture`, `doc_file`, `link`, `seq_no`) VALUES (7,'New England Family Hstory Website','Web application that supports creation of the conference and participant registration','resource_picture_7.jpg','','www.nefamilyhistory.com',7);
INSERT INTO `resources` (`id`, `name`, `description`, `picture`, `doc_file`, `link`, `seq_no`) VALUES (8,'Joinme.com','This is a free screen sharing software, so that all members of a conference call can see the presenter\'s computer screen.\r\n\r\nIt is very simple to setup.  Prior to the meeting the presenter will go to www.joinme.com and click on the button next to the word \"Share\".  This will download software that will enable screen sharing.  \r\n\r\nOnce in the meeting, the participants will go to www.joinme.com and click on the button next to the word \"Join\".  The presenter will provide the group with a 9 digit number for access to the screen sharing session.','resource_picture_8.jpg','','www.joinme.com',8);
INSERT INTO `resources` (`id`, `name`, `description`, `picture`, `doc_file`, `link`, `seq_no`) VALUES (9,'FreeConferenceCall.com','Just as the name says, this is a free conference call service.  ','resource_picture_9.jpg','','http://www.freeconferencecall.com/fcc/index.asp?promocode=FCC_PPC_GS_US_EN_282&gclid=CJihjtH6zLYCFRCe4AodPy4AIA',9);
INSERT INTO `resources` (`id`, `name`, `description`, `picture`, `doc_file`, `link`, `seq_no`) VALUES (10,'Individual Participant Schedule Reports','There are 8 different reports each is a set of individual participant schedules for those participants who meet the criteria.\r\n\r\n1. Syllabus and Ham Sandwich\r\n2. Syllabus and Turkey Sandwich\r\n3. Syllabus and Vegetarian Sandwich\r\n4. Ham Sandwich, no syllabus\r\n5. Turkey Sandwich, no syllabus\r\n6. Vegetarian Sandwich, no syllabus\r\n7. Syllabus, no Lunch\r\n8. No Order, just Schedule','resource_picture_10.jpg','','',10);
INSERT INTO `resources` (`id`, `name`, `description`, `picture`, `doc_file`, `link`, `seq_no`) VALUES (11,'Name Tag Template - Participants','This is a template for printing the participant name tags.  ','resource_picture_11.jpg','','',11);
INSERT INTO `resources` (`id`, `name`, `description`, `picture`, `doc_file`, `link`, `seq_no`) VALUES (12,'Registration Supplies/Inventory List','Check the registration box for leftovers from the previous year, and only buy what is needed.  All supplies are stored in the Franklin Family History Center on the bottom shelf of the locked cabinet.  ','resource_picture_12.jpg','{doc:regsuppinv.xls}','',12);
INSERT INTO `resources` (`id`, `name`, `description`, `picture`, `doc_file`, `link`, `seq_no`) VALUES (14,'Setup Book','Book that contains diagrams and photos of how to setup the building.  This is a hard copy book that is stored in the Conference Storage box in the Franklin Family History Center.  This book should not leave the premises.  The document below is an outline only.','resource_picture_14.jpg','{doc:setupbook.doc}','',14);
INSERT INTO `resources` (`id`, `name`, `description`, `picture`, `doc_file`, `link`, `seq_no`) VALUES (15,'Speaker Gift Example (2013)','Dennis and Barbara Hawley were asked to provide gifts for the speakers for the 2013 conference.  Here Barbara describes her approach.  \"My first thought was that no one needs more useless items.  We decided to provide a handmade turned wooden ball point pen that Dennis makes.  They are beautifully done and can always be used.  Along with that, a notebook was enclosed.  Everyone needs a sweet so we made homemade fudge and provided a small box for each speaker.  We put these items in brightly colored gift bags with each speaker\'s name on the bag.\"','resource_picture_15.jpg','','',15);
INSERT INTO `resources` (`id`, `name`, `description`, `picture`, `doc_file`, `link`, `seq_no`) VALUES (16,'Registration Signage','All of the following laminated signs are stored in the Registration Box on the shelf, in the locked cabinet, in the Franklin Family History Center.\r\n\r\nWalkin Registration (2)\r\nExtra Syllabi For Sale $7.00 (2)\r\nWhite Envelopes (Return Pile) (2)\r\nFree Materials\r\nWalkins <--\r\nWalkins /|\\ (2)\r\nWalkins -->\r\n\r\nFor Boxes:\r\n\r\nA-B\r\nC-De\r\nDi-Ge\r\nGi-J\r\nK-Mo\r\nMu-Re\r\nRi-S\r\nT-Z\r\n\r\nBig Signs:\r\n\r\nWalk-ins Registration\r\nRegistration A-J\r\nRegistration K-Z','resource_picture_16.jpg','','',16);
INSERT INTO `resources` (`id`, `name`, `description`, `picture`, `doc_file`, `link`, `seq_no`) VALUES (17,'Parking Signs and Cones','These are stored in the Franklin Family History Center.  Two large cones in the corner.  Signs in a box on the bottom shelf of the locked cabinet.','resource_picture_17.jpg','','',17);
INSERT INTO `resources` (`id`, `name`, `description`, `picture`, `doc_file`, `link`, `seq_no`) VALUES (18,'Meeting Notes From Lessons Learned Meeting','Notes and brainstorming ideas from the Lessons Learned meeting.','resource_picture_18.jpg','{doc:2013-Lessons_Learned_Notes.doc}','',18);
INSERT INTO `resources` (`id`, `name`, `description`, `picture`, `doc_file`, `link`, `seq_no`) VALUES (19,'Key Tasks and Dependencies','This document gives a timeline of the most important tasks and how they are related.','resource_picture_19.jpg','{doc:key_tasks_and_dependencies.xls)','',1);
INSERT INTO `resources` (`id`, `name`, `description`, `picture`, `doc_file`, `link`, `seq_no`) VALUES (20,'Past Year Program','An example of a program from a previous year.','resource_picture_20.jpg','{doc:2013_program.doc}','',20);
INSERT INTO `resources` (`id`, `name`, `description`, `picture`, `doc_file`, `link`, `seq_no`) VALUES (21,'Accounting Check-List','','resource_picture_21.jpg','','',21);
INSERT INTO `resources` (`id`, `name`, `description`, `picture`, `doc_file`, `link`, `seq_no`) VALUES (22,'Conference Day Collections','Form to be printed to capture payments and counts of syllabuses and/or lunches purchased.','resource_picture_22.jpg','{doc:conf_day_collections.xls}','',22);
INSERT INTO `resources` (`id`, `name`, `description`, `picture`, `doc_file`, `link`, `seq_no`) VALUES (23,'Networking Session Grocery List','Regarding the Networking refreshments for the 2013 Family History Conference...\r\n\r\nHere were the items purchased:\r\n\r\n• 2 Jumbo Bags of Tortilla Chips ($5.79ea.)\r\n• 1 Large Container of Regular Hummus ($5.99)\r\n• 2 Large Containers of Moe\'s Brand 7-layer dip ($5.99ea.)\r\n• 2 Assorted Fruit Trays ($8.99ea.)\r\n• 2 Assorted Veggie Trays ($7.99ea.)\r\n• 1 Jumbo box of Ritz Crackers ($5.29)\r\n• 1 Tray of Cheese squares ($9.99)\r\n• 1 Tray of Meat squares ($9.99)\r\n• 1 48oz package of Chips Ahoy Cookies ($5.69)\r\n• 1 Large Package of Napkins ($3.99)\r\n• 1 Large Package of Plastic Cups ($9.99)\r\n\r\nSubTotal Price at BJ\'s Wholesale: $108.45\r\n\r\nSuggestions: the 5-layer dip and hummus were a HUGE favorite. I would recommend buying a larger quantity of that next year.\r\n\r\nSincerely,\r\n\r\nAndrew Hovey',NULL,'','',23);
INSERT INTO `resources` (`id`, `name`, `description`, `picture`, `doc_file`, `link`, `seq_no`) VALUES (24,'Networking Session Grocery List','Regarding the Networking refreshments for the 2013 Family History Conference...\r\n\r\nHere were the items purchased:\r\n\r\n• 2 Jumbo Bags of Tortilla Chips ($5.79ea.)\r\n• 1 Large Container of Regular Hummus ($5.99)\r\n• 2 Large Containers of Moe\'s Brand 7-layer dip ($5.99ea.)\r\n• 2 Assorted Fruit Trays ($8.99ea.)\r\n• 2 Assorted Veggie Trays ($7.99ea.)\r\n• 1 Jumbo box of Ritz Crackers ($5.29)\r\n• 1 Tray of Cheese squares ($9.99)\r\n• 1 Tray of Meat squares ($9.99)\r\n• 1 48oz package of Chips Ahoy Cookies ($5.69)\r\n• 1 Large Package of Napkins ($3.99)\r\n• 1 Large Package of Plastic Cups ($9.99)\r\n\r\nSubTotal Price at BJ\'s Wholesale: $108.45\r\n\r\nSuggestions: the 5-layer dip and hummus were a HUGE favorite. I would recommend buying a larger quantity of that next year.\r\n\r\nSincerely,\r\n\r\nAndrew Hovey','resource_picture_24.jpg','','',24);
INSERT INTO `resources` (`id`, `name`, `description`, `picture`, `doc_file`, `link`, `seq_no`) VALUES (25,'Speaker Packet Contents','* Lunch Ticket\r\n* Class Schedule specific to Speaker\r\n* 8 1/2 x 11 map of the building (highlights for whare they will be teaching and where the nearest bathroom is)\r\n* Name Tag\r\n* Program\r\n* Syllabus (if they want one)','resource_picture_25.jpg','','',25);
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_assignments`
--

DROP TABLE IF EXISTS `role_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_assignments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_event_id` int(11) DEFAULT NULL,
  `volunteer_volunteer_id` int(11) DEFAULT NULL,
  `committee_role_committee_role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_role_assignments_volunteer_volunteer_id` (`volunteer_volunteer_id`),
  KEY `fk_role_assignments_committee_role_committee_role_id` (`committee_role_committee_role_id`),
  KEY `fk_role_assignments_event_event_id` (`event_event_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_assignments`
--

LOCK TABLES `role_assignments` WRITE;
/*!40000 ALTER TABLE `role_assignments` DISABLE KEYS */;
INSERT INTO `role_assignments` (`id`, `name`, `event_event_id`, `volunteer_volunteer_id`, `committee_role_committee_role_id`) VALUES (1,'Co-chair: Manny Mello (2013)',9,1,3);
INSERT INTO `role_assignments` (`id`, `name`, `event_event_id`, `volunteer_volunteer_id`, `committee_role_committee_role_id`) VALUES (2,'FH Consultant Coordinator: Sylvia Lyons (2013)',9,2,24);
INSERT INTO `role_assignments` (`id`, `name`, `event_event_id`, `volunteer_volunteer_id`, `committee_role_committee_role_id`) VALUES (3,'Information Committee Lead: Diana Wild (2013)',9,3,13);
INSERT INTO `role_assignments` (`id`, `name`, `event_event_id`, `volunteer_volunteer_id`, `committee_role_committee_role_id`) VALUES (4,'Speaker Host: Judy Matteson (2013)',9,4,6);
INSERT INTO `role_assignments` (`id`, `name`, `event_event_id`, `volunteer_volunteer_id`, `committee_role_committee_role_id`) VALUES (5,'Technical Committee Lead: Mello (2013)',9,1,25);
INSERT INTO `role_assignments` (`id`, `name`, `event_event_id`, `volunteer_volunteer_id`, `committee_role_committee_role_id`) VALUES (6,'Executive Sponsor: Martin (2013)',9,15,1);
INSERT INTO `role_assignments` (`id`, `name`, `event_event_id`, `volunteer_volunteer_id`, `committee_role_committee_role_id`) VALUES (7,'Payment Registrar - Priesthood Holder: Hielner (2013)',9,16,44);
INSERT INTO `role_assignments` (`id`, `name`, `event_event_id`, `volunteer_volunteer_id`, `committee_role_committee_role_id`) VALUES (8,'Program Committee Member: McDougall (2013)',9,10,40);
INSERT INTO `role_assignments` (`id`, `name`, `event_event_id`, `volunteer_volunteer_id`, `committee_role_committee_role_id`) VALUES (10,'Registration Committee Member: Meredith (2013)',9,11,12);
INSERT INTO `role_assignments` (`id`, `name`, `event_event_id`, `volunteer_volunteer_id`, `committee_role_committee_role_id`) VALUES (14,'Co-chair: Lyons (2013)',9,2,3);
INSERT INTO `role_assignments` (`id`, `name`, `event_event_id`, `volunteer_volunteer_id`, `committee_role_committee_role_id`) VALUES (13,'Speaker Host: Lewis (2013)',9,9,6);
INSERT INTO `role_assignments` (`id`, `name`, `event_event_id`, `volunteer_volunteer_id`, `committee_role_committee_role_id`) VALUES (15,'Unassigned: Dennis Hawley (2013)',9,8,7);
INSERT INTO `role_assignments` (`id`, `name`, `event_event_id`, `volunteer_volunteer_id`, `committee_role_committee_role_id`) VALUES (16,'Lunch Lead: Howe (2012)',8,17,32);
INSERT INTO `role_assignments` (`id`, `name`, `event_event_id`, `volunteer_volunteer_id`, `committee_role_committee_role_id`) VALUES (17,'Co-chair: Sylvia Lyons (2014)',10,2,3);
INSERT INTO `role_assignments` (`id`, `name`, `event_event_id`, `volunteer_volunteer_id`, `committee_role_committee_role_id`) VALUES (18,'Info - Syllabus Coordinator: Burger (2013)',9,18,16);
INSERT INTO `role_assignments` (`id`, `name`, `event_event_id`, `volunteer_volunteer_id`, `committee_role_committee_role_id`) VALUES (19,'Co-chair: Wild (2014)',10,3,3);
INSERT INTO `role_assignments` (`id`, `name`, `event_event_id`, `volunteer_volunteer_id`, `committee_role_committee_role_id`) VALUES (20,'Stake High Council Advisor: TRUSCOTT (2014)',10,19,2);
INSERT INTO `role_assignments` (`id`, `name`, `event_event_id`, `volunteer_volunteer_id`, `committee_role_committee_role_id`) VALUES (21,'Program Committee Lead:  (2014)',10,NULL,42);
INSERT INTO `role_assignments` (`id`, `name`, `event_event_id`, `volunteer_volunteer_id`, `committee_role_committee_role_id`) VALUES (22,'Registration Committee Lead:  (2014)',10,NULL,9);
INSERT INTO `role_assignments` (`id`, `name`, `event_event_id`, `volunteer_volunteer_id`, `committee_role_committee_role_id`) VALUES (23,'Food Committee Lead:  (2014)',10,NULL,38);
INSERT INTO `role_assignments` (`id`, `name`, `event_event_id`, `volunteer_volunteer_id`, `committee_role_committee_role_id`) VALUES (24,'Host Committee Lead:  (2014)',10,NULL,5);
INSERT INTO `role_assignments` (`id`, `name`, `event_event_id`, `volunteer_volunteer_id`, `committee_role_committee_role_id`) VALUES (25,'Information Committee Lead:  (2014)',10,NULL,13);
INSERT INTO `role_assignments` (`id`, `name`, `event_event_id`, `volunteer_volunteer_id`, `committee_role_committee_role_id`) VALUES (26,'Publicity Committee Lead:  (2014)',10,NULL,21);
INSERT INTO `role_assignments` (`id`, `name`, `event_event_id`, `volunteer_volunteer_id`, `committee_role_committee_role_id`) VALUES (27,'Setup Committee Lead:  (2014)',10,NULL,27);
INSERT INTO `role_assignments` (`id`, `name`, `event_event_id`, `volunteer_volunteer_id`, `committee_role_committee_role_id`) VALUES (28,'Technical Committee Lead:  (2014)',10,NULL,25);
INSERT INTO `role_assignments` (`id`, `name`, `event_event_id`, `volunteer_volunteer_id`, `committee_role_committee_role_id`) VALUES (29,'Parking Committee Lead:  (2014)',10,NULL,30);
INSERT INTO `role_assignments` (`id`, `name`, `event_event_id`, `volunteer_volunteer_id`, `committee_role_committee_role_id`) VALUES (30,'Clean-up Committee Lead:  (2014)',10,NULL,34);
INSERT INTO `role_assignments` (`id`, `name`, `event_event_id`, `volunteer_volunteer_id`, `committee_role_committee_role_id`) VALUES (31,'Executive Sponsor: Martin (2014)',10,15,1);
INSERT INTO `role_assignments` (`id`, `name`, `event_event_id`, `volunteer_volunteer_id`, `committee_role_committee_role_id`) VALUES (32,'Cashier:  (2014)',10,NULL,45);
/*!40000 ALTER TABLE `role_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_objs`
--

DROP TABLE IF EXISTS `task_objs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_objs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `month_week` int(11) DEFAULT NULL,
  `seq_no` int(11) DEFAULT NULL,
  `month_month_id` int(11) DEFAULT NULL,
  `meeting_meeting_id` int(11) DEFAULT NULL,
  `predecessor_task_obj_id` int(11) DEFAULT NULL,
  `committee_role_committee_role_id` int(11) DEFAULT NULL,
  `key_task` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_task_objs_meeting_meeting_id` (`meeting_meeting_id`),
  KEY `fk_task_objs_month_month_id` (`month_month_id`),
  KEY `fk_task_objs_committee_role_committee_role_id` (`committee_role_committee_role_id`),
  KEY `fk_task_objs_predecessor_task_obj_id` (`predecessor_task_obj_id`)
) ENGINE=MyISAM AUTO_INCREMENT=252 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_objs`
--

LOCK TABLES `task_objs` WRITE;
/*!40000 ALTER TABLE `task_objs` DISABLE KEYS */;
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (1,'SETUP - Mount Standard signage','Includes: Bathroom signs (Mens front bathroom is converted to a women\'s bathroom) Handicapped bathroom sign Parking Signs Conference Sandwich Boards at both ends of Jordan Road Non-smoking signs No coffee in the building signs Registration Signage will be mounted by the Registration Committee Classroom Signage will be mounted by the Program Commitee',4,82,12,14,NULL,28,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (2,'HOST - Assemble Speaker Packet','The speaker packet includes the schedule for the day, a program, a copy of the syllabus, etc.',1,103,12,17,219,6,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (3,'PUB - Update Library, Society list','The committee keeps a list of area genealogy societies and libraries and regular libraries and other venues that might be willing to post a poster about the conference. Year to year the list can change. As changes are discovered the list is maintained.  Should include contact information.',1,62,9,11,NULL,21,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (4,'REG - Walk-in Registration','On the day of the conference, sit at the walk-ins table and collect information from them so they can be included on our mailing list.  Explain that pre-registered participants take priority for smaller classes and that the class host will also explain this to them.  Make sure they have a walk-in colored name tag so that the class hosts can recognize them as walk-ins.',4,139,12,19,NULL,12,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (5,'LEAD - Conduct Lessons Learned Meeting','Results of participant, speaker, committee member surveys are presented and discussed.  Brainstorming of ideas for addressing issues.  ',2,9,2,1,227,3,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (8,'CLEAN - Clean Building','Perform all usual cleaning activities associated with preparing the building for Sunday.  Resource: Building cleaning list',4,151,12,NULL,9,35,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (9,'CLEAN - Fold up Tables and Chairs and Stow under stage','',4,152,12,NULL,NULL,35,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (11,'CLEAN - Remove Signage and store for reuse','Very important that the signage is returned to the designated box.',4,154,12,NULL,130,35,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (14,'CLEAN - Create Clean up Committee','Identifies volunteers for cleanup toward the end of the conference and after the conference has closed.',1,83,11,NULL,NULL,34,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (16,'INFO - Provide Participant Evaluation Results','Develop reports based on survey results to share at lessons learned meeting.',2,10,2,1,82,36,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (17,'LEAD - Obtain Approval for Speaker Expenses','This is a free conference and we generally request that speakers volunteer their time and send us materials for publishing in the paper syllabus and on-line, however, occasionally a speaker submits a request for reimbursement.  These may appear before or',1,86,11,NULL,174,3,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (18,'LEAD - Oversee Conference Day','Ensure that the day goes smoothly.  Resolve issues.  etc.',4,114,12,NULL,NULL,3,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (20,'LEAD - Prepare Public View of Website','Update the main page of the website to reflect the information for the current year\'s conference.',4,34,7,NULL,32,3,1);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (21,'LEAD - Respond to Pre-Conference Questions','Prior to the open of pre-registration, email is responded to by one of the co-chairs.  Messages can be forwarded to the co-chair\'s email if desired.  It is recommended that these messages are responded to from the conference gmail account to avoid the mix of conference and personal email.',2,8,2,NULL,5,3,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (23,'LEAD - Suggest Sub-committee Leaders','',1,28,6,6,NULL,3,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (24,'LEAD - Set Budget for Networking Refreshments','',2,92,11,NULL,NULL,3,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (25,'LEAD - Set Budget for Speaker Gift','',2,93,11,NULL,NULL,3,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (26,'LEAD - Request new Website Function','Send proposal for new function to web master for discussion and prioritization.',4,27,3,NULL,NULL,3,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (27,'PROG - Create Roadshow Slot','A Roadshow slot is a 15 minute time when a speaker is available for a one-on-one consultation with an individual participant to help them with a specific issue they are having with their research.  In order to schedule the Roadshow slots we need to know when the speakers are scheduled to present their formal presentations.  We do not need to have finalized the rooms where they will present.',4,46,7,8,28,39,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (28,'PROG - Create Speaker Record','Enter the speaker information (contact info, bio and picture) into www.nefamilyhistory.com',1,19,6,8,134,39,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (29,'PROG - Declare website ready for pre-registration','Checklist for website readiness:\r\n\r\n1. Main page is complete and has been proofread.\r\n2. Speaker contact information is complete and proofread\r\n3. Speaker bios complete and proofread\r\n4. Speaker photos loaded.\r\n5. Presentation titles confirmed with speakers.\r\n6. Presentation descriptions complete and proofread.\r\n7. Roadshow slots created for those who want to do them.\r\n8. Participant Login function has been tested and confirmed. \n\nThe following can be completed later:\r\n\r\n1. Speaker Needs \r\n2. Assignment of presentations to rooms',1,59,9,7,27,39,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (30,'LEAD - Frame the Program','Determines what will be taught at the conference.  Uses feedback from previous evaluations along with information about past conferences to design a program that will satisfy the broad range of needs of our participants.',1,15,7,5,170,3,1);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (32,'LEAD - Initialize Website for new Conference','The participant side of the website holds information for a single conference.  Once that conference is over the information for the current year is copied to the historical part of the website for future reference.  A new conference is initiated (new Event record) and the new conference information (speakers, presentations, etc.) is then added.  The program manager works with the information committee lead to decide which items should be deleted and which can be reused for the next conference.',4,17,2,NULL,201,3,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (35,'REG - Participant Registers for a Roadshow Appointment','The participant sees that participant view of the roadshow appointments.  Once a participant has signed up for a roadshow appointment, the name of the participant will appear from the administrator view of the same information.',2,78,10,19,216,37,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (36,'LEAD - Report Expenses for Reimbursement','',4,200,1,NULL,18,3,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (37,'PROG - Schedule Presentation','Determine when the presentation will be presented, which track and which time.',2,64,9,7,136,39,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (38,'PUB - Coordinate Newspaper Articles','Arranges for local papers to write stories about the conference in local papers.',1,57,9,11,NULL,22,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (39,'PUB - Coordinate Press Releases','Arranges for the design of press releases, contacts newspapers and others that are willing to publish press releases',1,58,9,11,NULL,22,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (41,'PUB - Maintain List of Local Newspapers','Creates/updates list of newspapers in and around Franklin, including all towns within the Franklin Ward and Branch and neighboring towns such as Cumberland, RI, Woonsocket, RI, Pawtucket, RI and Providence, RI.  Should include contact information.',1,41,7,11,NULL,21,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (42,'PUB - Obtain Publicity Contact Lists','Obtain/create list of Family History Consultants, Other Stake Presidencies.',1,42,7,11,NULL,21,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (43,'PUB - Assemble Publicty Packets','Package fliers, posters etc. with a letter about the conference.  May be done electronically, i.e., allow for local printing.',2,63,9,11,47,23,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (44,'PUB - Distribute Publicity Packets','Packets may be distributed to FH Consultants, Hingham Stake Bishops, Other Stake Presidencies/Bishops.',1,73,10,11,194,23,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (45,'PUB - Assemble & Distribute FH Consultant Packets','',1,47,8,11,194,24,1);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (46,'PUB - Obtain FH Consultant List','',1,32,6,11,NULL,24,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (47,'INFO - Create Poster','Uses committee ancestor photos to design posters.  If expense is approved, poster may be in color.',1,48,8,NULL,208,14,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (48,'INFO - Create News Paper Add','Uses committee ancestor photos to design newspaper ads.  See Communications Committee, public relations member for specific sizes.',1,49,8,NULL,NULL,14,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (49,'INFO - Create Program and Syllabus Cover','Uses committee ancestor photos to design program cover (letter folded in half  5.5 x 8.5 vertical) and syllabus cover, 8  x LEADLEAD',1,50,8,NULL,208,14,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (50,'INFO - Obtain Committee Ancestor Photos','Coordinates with Information Committee Member responsible for collecting committee ancestor photos.',1,52,8,NULL,NULL,14,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (51,'INFO - Create CD of Photos','Create CD of photos and give it to the information committee lead for load onto wesite',4,157,12,NULL,NULL,20,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (52,'INFO - Document the Day','Photos of people arriving, at registration, parking attendants, lunch preparation, etc.',4,159,12,NULL,NULL,20,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (53,'INFO - Photograph attendance','Photos of the class participants, photo of the chapel when full at the beginning.',4,146,12,NULL,NULL,20,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (54,'INFO - Photograph each speaker at work','Photos of speakers giving their presentations.  Makes every effort to take flattering pictures.',4,147,12,NULL,NULL,20,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (55,'INFO - Photograph Setup','Photographs of each room and how it is setup for future setup committee.  Dont forget the speaker lounge.',4,129,12,NULL,NULL,20,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (56,'INFO - Take informal Photos','Candid shots when participants and speakers are relaxed.  At lunch, at networking session.',4,148,12,NULL,NULL,20,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (57,'INFO - Announce Syllabus Download available - Participants','An email goes out to the current list of participants (not the entire mailing list), when the majority of the syllabus inserts are ready for download.  Subsequent messages are sent out when remaining inserts have been posted.',2,89,11,NULL,59,15,1);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (58,'INFO - Assemble Paper Syllabus','Syllabus inserts are provided by individual speakers via email in Microsoft Word format. Syllabus Coordinator assembles the Syllabus into a book. The syllabus book includes: * a cover with graphics that match the posters, program and other graphical materials * a copy of the program grid * a table of contents with page numbers * dividers for each speaker with their biography and picture * the syllabus materials provided by the This is a technical activity, there are many issues with how the materials are provided that need to be ironed out. The person selected for this role needs to have intermediate to advanced MS Word skills.',1,71,10,NULL,84,16,1);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (59,'INFO - Load PDFs into Website for Free Download','It is recommended that the speakers are requested to provide their inserts in two forms, MS Word and PDF, however it is unlikely that all speakers will have this capability. Converts MS Word syllabus inserts from MS Word into PDF files. (We use PDF files to avoid incompatiblity/version issues with use of MS Word.) Loads the PDFs onto the website and tests each download.',1,74,10,NULL,84,16,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (61,'INFO - Turn on Pre-registration for the Conference','When the program is ready for participants to login, the programmer will make the participant website available for participant pre-registration.',1,65,10,NULL,NULL,19,1);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (62,'INFO - Turns on Website Under Construction','As the program is developed the website will be changing as new content is added and revised to create the new program. The programmer will turn off participant logins during this period. Administrator logins (committee members) will remain active.',1,16,4,NULL,180,19,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (63,'INFO - Develop Management Reports from the Database','Provides specialized reports to leadership based on needs.',1,43,6,NULL,NULL,13,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (64,'INFO - Interface with Website Programmer','Understands issues with website and documents new requirements and works with programmer to schedule, implement and test new functions.',1,28,3,NULL,NULL,17,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (66,'INFO - Maintain Conference History','Maintains lists of topics, committee Roles & Tasks, frequently asked questions, etc.  Maintains conference program and mailing list.',1,73,1,NULL,NULL,13,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (67,'INFO - Maintain Non-Program Related Web Content','',1,200,1,NULL,NULL,13,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (74,'INFO - Announce Pre-Registration Open - Mailing List','Send email to entire mailing list indicating that they can pre-register for the conference.  See example wording below.',1,66,10,NULL,29,15,1);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (75,'INFO - Announce SAVE THE DATE - Mailing List','Send email to entire mailing list via Mail Chimp.  See example wording below.',1,44,7,NULL,NULL,15,1);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (76,'INFO - Support FH Consultant Coordinator Information Needs','',1,61,9,NULL,NULL,18,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (232,'HOST - Provide Speaker Evaluation Results','Compile feedback from speakers and present at the Lessons Learned meeting.',2,10,1,17,230,5,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (78,'INFO - Support Registration Committee  Pre-registration','Ensures that registration committee has everything they need from the FHC database during pre-registration and as they prepare the packets for the participants.',1,132,10,NULL,NULL,18,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (80,'INFO - Train New Committee Leaders on use of website','Prepares and presents training on how to use the web application.  This may include classroom training, webinars and provision of written training materials.',1,25,3,NULL,165,17,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (81,'INFO - Collect Committee Ancestor Photos','Collects photos, may involve photographing old photos.  Going to peoples houses.  Once photos are in digital format, sends photos to Graphics designer for use in posters etc.',2,45,7,NULL,NULL,14,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (82,'INFO - Create/Update On-line PARTICIPANT Evaluation','Updates survey on Survey Monkey to meet needs of current year.  Updates Mail Chimp participant mailing list based on final list of participants, including walk-ins.  Send announcement to participants indicating that the link is available on the www.nefamilyhistory.com website.  Need to make sure the link has been updated before the announcement is sent.',3,3,12,NULL,18,36,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (83,'INFO - Load Committee FH Photographs','The committee has a tradition to use photographs of our own ancestors to decorate the family history website and graphics.',1,51,8,NULL,NULL,17,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (84,'PROG - Obtain Syllabus Inserts','See also, Speaker Engagement Script.  Establish deadline and communicate it to the speakers.  Make initial request from each speaker, send reminders and follow-up as necessary.',1,85,11,NULL,137,40,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (86,'INFO - Support Comm Committee with Information Needs','Provides any information that can be gleaned from the FHC database that helps with communication.',1,54,8,NULL,NULL,18,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (88,'INFO - Support Host Committee Speaker Packet Assembly','Print speaker name tags (different color from participant name tags), print additional information as directed by the Speaker Host Committee Lead',4,102,12,NULL,215,18,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (89,'FOOD - Assemble and Distribute Lunches','Leads assembly and distribution of lunches on the day of the conference.',4,117,12,NULL,NULL,32,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (90,'FOOD - Design Lunch Menu','Selects sandwich choices, fruit, other dessert, drinks, etc.  Updates menu in Event object from admin view of the web application www.nefamilyhistory.com',4,56,8,18,NULL,32,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (91,'FOOD - Purchase Lunch Food','The lunch budget is the lunch price times the number of participants who have paid for their lunch.  Pre-registration closes 2 weeks before the conference.  It is best to wait until LEAD week before the conference to be sure as some numbers can change in the transition week.  In addition you will be providing lunches for the speakers (free) and the missionaries (free).  The website keeps track of the number of participants who have paid for their lunch.  Reminder emails are sent to participants who have ordered lunch but who have not paid for it up to the last week.  Check with the committee leadership on number of extra lunches to be sold on the day of the conference.  It is usually LEAD0% extra.  Contact people who have held the role in the past for advice.',4,107,12,NULL,213,32,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (92,'FOOD - Display & Maintain Networking Food','Creates display of networking food and maintains the display as the food is consumed.',4,144,12,NULL,95,33,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (94,'FOOD - Purchase Food for Networking Session','Check with committee leadership for budget for networking session.  Check with those who have previously had the role for quantities.',4,119,12,NULL,222,33,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (95,'FOOD - Select menu for networking session','Must include healthy and non-sweet options for those who have health issues with sugar.  Fruit and vegetable plates in addition to cookies and other sweets.  Resources: Photos of food from previous networking sessions.',1,118,12,18,NULL,33,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (97,'PARK - Create Parking Sub-committee','Identifies volunteers to help with parking for the day of the conference (can use some missionaries)',3,97,11,3,166,30,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (98,'PARK - Direct Committee Members in Parking','Assigns specific tasks to Parking committee Members',4,115,12,10,184,30,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (99,'PARK - Direct Vehicle Drivers in Parking','Ensure that vehicles are parked in a manner than ensures safety, efficient use of space and the ability for vehicles to leave in an orderly manner.',4,116,12,10,NULL,31,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (100,'ACCT - Identify Unpaid Participants','When all checks have been received, the Payment Registrar will provide the Registration Lead with a list of participants who have not paid.',1,70,10,NULL,102,44,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (101,'ACCT - Receive checks and processes bank deposits','Receive check and record in system. Create periodic deposit (group of checks) and print deposit slip for bank. Recheck that each check is correctly recorded on the deposit slip. Make any adjustments in the system and recreate the deposit if necessary.',1,68,10,NULL,197,44,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (102,'ACCT - Record which participants each check covers','A critical element of this role is to indicate which participants are being paid for by a given check. Often a participant will pay for a friend or family member. This step is essential in ensuring a smooth registration process. If it is unclear whether someone has paid it causes a great deal of heartache for both the participant and the registration comittee.',1,69,10,NULL,NULL,44,1);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (103,'ACCT - Send payment reminder to participant','Often a participant will sign up for the conference, but then will forget to pay.  We provide the ability for the Payment Registrar to create a list of emails to send a reminder email to.  The team member can either use their own email account or use the conference account nefamilyhistory@gmail.com',2,95,11,NULL,100,44,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (106,'REG - Customer Service','Ensures smooth registration process.  Begins as soon as pre-registration is announced.',1,67,10,19,74,11,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (107,'REG - Develop Registration Committee','Identifies and requests the service from potential committee members to help with packet assembly and registration on the day of the conference.  Need 4-6 people for packet assembly and at least 8 people for the day of the conference.',1,30,3,NULL,NULL,9,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (108,'REG - Ensure Participant Info is Complete and Correct','The registration committee lead is the person closest to the participants and the correctness of the information about the participants is key to ease of assembly of the participant packets as well as happy participants on the day of the conference.  It is a good idea to check each day during pre-registration to ensure there are no duplicates, no oddballs, i.e., Mickey Mouse.  Also check that participants have completely the information.',1,84,11,NULL,74,9,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (109,'REG - Monitor Conference Email Account','Triages email communication from conference participants during the pre-registration process before the conference. Responds to emails from conference participants during the pre-registration process. Forwards emails to other committee members for special expertise.',1,60,9,19,NULL,9,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (110,'REG - Mount Registration Signage','Signs that direct participants to one side of the building or the other.  Signs that direct participants to a specific part of the registration table.  Signs for Walkins.  Any other signs specific to the smooth running of Registration.',4,134,12,19,NULL,9,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (111,'REG - Participant Problem Resolution','Answers participant questions and solves participant problems regarding their individual situation (registration packet, syllabus, payment, schedule, etc.) during the leadup to the conference through email and over the phone. Connects participants up with others who can solve their issue when needed, for example, the web master, the setup people regarding a special needs issue, etc.',1,75,10,19,213,9,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (112,'REG - Registration Setup','During the setup of the conference, ensures that the registration areas are setup according to the committees needs.  Mounts registration specific signs, i.e., signs that direct participants to one side of the building or the other. Signs that direct participants to a specific part of the registration table. Signs for Walkins. Any other signs specific to the smooth running of Registration.',4,133,12,19,NULL,9,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (113,'REG - Assemble Participant Packet','Accurately and efficiently stuff 400+ participant packets with conference materials.',3,112,12,19,195,12,1);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (114,'REG - Participant Registration','On the day of the conference, sit at one of the registration tables and pass out registration packets to participants who have pre-registered.  Report issues to Registration Lead.  Some registration committee members will register walk-ins.  The walk-in will fill out a paper form (see below) and the registration committee member will update the mailing list.',4,138,12,19,NULL,12,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (198,'HOST - Assign Lodging/Transportation Provider to Speaker','Introduce the Speaker, usually via email, to the person(s) who will be providing them with transportation or lodging.',2,94,11,17,207,40,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (116,'SETUP - Develop Setup Committee','Identify sub-commitee members to help during the setup period 2 days before the conference. Conveys objectives of setup committee.  Oversees setup activities.  Resource: Classroom setup photographs from previous conferences.',4,121,12,13,NULL,27,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (117,'SETUP - Set up unused spaces with tables for dining','Tables and chairs are setup in unused classroom spaces to provide additional dining space.  The stage, smaller classrooms on both sides of the cultural hall.',4,123,12,15,NULL,28,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (118,'SETUP - Setup Furniture in Classrooms','Setup classrooms and cultural hall according to previously established pattern. Understand specific speaker needs for classroom and ensure stand for projector, display equipment, easels, table, podium, etc are available.',4,124,12,15,NULL,28,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (119,'SETUP - Setup Networking Refreshments Table','The Networking table is stored behind the folding wall in the overflow area during the last presentation. The food is setup during the last presentation. The table is then scooted out, with the food already on it, into the Cultural Hall all ready for the Networking Session.',4,125,12,13,NULL,28,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (120,'SETUP - Setup Furniture in Registration Areas','Registration is setup for half the participants in the lobby (Stake Offices side), and the other half in the lobby (Bishops Offices side). The walk-ins table is setup on the Bishops Offices side. Setup of the Registration Area is to be coordinated with the Registration Committee Leader.',4,126,12,15,NULL,28,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (121,'SETUP - Setup Furniture in Speaker Lounge','Furniture (couches, chairs and small tables) from lobbies is arranged into a lounge for the speakers. See Speaker Lounge photographs in Setup Book',4,127,12,15,NULL,28,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (122,'SETUP - Arrange for Table Decorations','Decorate all tables designated as dining tables.  Maybe all over the building.  There are fake flower decorations somewhere.',3,109,12,14,NULL,29,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (123,'SETUP - Arrange for Tablecloths','Ensure that all tables designated as dining tables have tablecloths.  We have used cloth tablecloths some years, but paper is fine as well and easier to cleanup.',3,110,12,14,NULL,29,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (124,'SETUP - Decorate Speaker Lounge','Decorate speaker lounge.  Check with the committee leadership as to whether there is a budget for Decorating.  Nice to have fresh flowers in the speakers lounge.',4,120,12,14,NULL,29,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (125,'HOST - Arrange Speaker Flights','Arrange airplane transportation for those coming from long distances (Florida, Utah).  Work with Executive Sponsor for access to donated frequent flyer points or other methods of payment.',1,82,11,17,141,1,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (126,'PROG - Assign Classroom to Presentation','Once pre-registration is closed, we have the information we need to determine which classroom will be used for each presentation.  Based on the number of participants signed up for each class the best classroom is selected.  This is done in the web application.\r\n\r\nFactors in this decision:\r\n\r\n*Capacity:* Where possible allow for walkins.\r\n*Speaker Convenience:* Try to make it so that speakers do not have to move from one room to another.',3,113,12,NULL,NULL,40,1);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (127,'PROG - Develop Classroom Sign Plan','Creates/updates classroom sign plan. Signs and information to be included: * Classroom Letter Designator (laminated Letter) * Classroom schedule (classes for each session) - printout from www.nefamilyhistory.com * Other materials',1,105,12,NULL,NULL,39,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (128,'HOST - Develop Speaker Host Committee','Ensures Speaker Hosts understand their role and tasks.  Ensures that Speaker Hosts have all resources they need to carry out their tasks, oversees progress and resolves issues.',4,31,10,17,NULL,5,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (130,'PROG - Mount Classroom Signs','Mounts signs that indicate information about each class at the class room door.  This includes the signage associated with the Roadshow.  \r\n\r\nThe setup book includes photos of exactly how to mount these signs.',4,130,12,14,236,42,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (131,'HOST - Purchase Speaker Gifts','Designs, purchases and assembles thank-you gift for each speaker that is within the budget provided by the committee leadership.  Contact prior gift designers for ideas.  The gifts should be delivered to the Speaker Lounge (Young Womens room) the day before or the morning of the conference.',2,91,11,17,NULL,8,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (132,'HOST - Arrange Speaker Lodging','Working with the Speaker Host Committee Lead, identifies church members and others willing to host a speaker in their home for one to two nights.',1,81,11,17,141,6,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (133,'HOST - Care for Speaker','On the day of the conference, attends to any special needs the speaker may have. Helps find tech helpers needed by the speaker. Ensure they have water. Whatever is needed.',4,136,12,17,NULL,6,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (134,'PROG - Collect and Document Speaker Information','Enter the speaker information (contact info, bio and picture) into www.nefamilyhistory.com.',1,35,7,8,NULL,40,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (135,'HOST - Count Participants in Class','On the day of the conference, it is important that we count the number of participants in each class.  As the speaker host you will have a piece of paper on which to write the count and you will be directed where to leave it.',4,142,12,17,NULL,6,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (136,'PROG - Create Presentation Record','Enters description of each class and associated information about a presentation in to www.nefamilyhistory.com',1,20,6,NULL,NULL,40,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (137,'PROG - Engage Speaker to Present','This is the most important task of the whole conference preparation phase!  We need to keep our speakers happy so they will do a great job presenting and so that they will be willing to come back again.  Identify speaker based on Program Frame.  Engages with speakers to request they speak at the conference.  See Speaker Script for additional information and specifics of what you will be asking of the speaker.',1,18,6,8,134,40,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (139,'HOST - Follow up with Speaker','Ahead of the conference, proactively contacts assigned speakers to ensure they are prepared and ready to speak and to ensure they have sent you everything that is needed for the website and the syllabus.  Please be prompt in responding to speaker communication.  You will sent the syllabus insert to the Information Committee Member responsible for assembling and the paper syllabus and uploading the digital syllabus.',1,37,7,17,NULL,6,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (140,'HOST - Greet Speaker','On the day of the conference, the Speaker Host should be available to greet the speaker(s) they have been assigned and show them to the speaker lounge and check with them at that point as to whether there is anything they need. Point out the bathrooms, handicapped is closest to the speaker lounge.  The speaker host might also introduce the speaker to other speakers especially if they are new.  This is the real host part!  J',4,135,12,17,241,6,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (141,'HOST - Identify Speaker Hospitality Transportation Needs','If a speaker comes from a long distance, determine if they need: * transportation (airplane ticket, pickup at airport, train station, etc.). * lodging (number of nights)',1,67,7,17,NULL,6,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (142,'HOST - Introduce Speaker to Class','On the day of the conference, in the past, the host has just read the speaker bio.  Often the speaker bio is dull sounding, too long or otherwise not that interesting to listen to.  Ideally, the speaker host will contact the speaker and ask them to write what they would like the host to read as an intro.  The intro may be different for different classes, for example, what was it that made the speaker particularly interested in the topic.  We have had feedback that the intros are repetitive (people attending two classes or more from the same speaker).',4,141,12,17,NULL,6,1);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (143,'HOST - Manage Participant Classroom Entry','On the day of the conference, participants who pre-registered for a class get priority over those who walked in on the day of the conference. The host ensures that the pre-registered people (name tag color distinguishes pre-registered participants from walk-ins).',4,140,12,17,NULL,6,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (144,'PROG - Register Speaker','This function enables speakers to update the information about themselves and their presentations and also to monitor their class sizes.',1,33,6,8,134,40,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (146,'LEAD - Provide High-Council Interface','',1,128,4,NULL,147,2,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (147,'LEAD - Determine date of the conference','The conference is usually held on the last Saturday of March, however, care needs to be taken that no competing activity is planned for the same day that might detract significantly from the conference.',1,2,1,NULL,NULL,1,1);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (148,'TECH - Direct Setup of Technology','* Conveys needs to sub-committee members * Assigns specific setup tasks to sub-committee members * Ensures that technolgoy has been tested',1,106,12,14,NULL,26,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (149,'TECH - Provide ad-hoc assistance to Speakers','Supports the Tech Lead on the day of the conference for resolution of techical issues, especially for the speakers',4,137,12,NULL,NULL,26,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (151,'TECH - Setup Technology','Setup projectors, laptops, and run wires, solicit for extension cords',4,128,12,14,NULL,26,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (152,'TECH - Create Tech Sub-committee','* Identifies volunteers to participate as tech sub-committee members * Conveys sub-committee objectives and role',1,72,10,NULL,NULL,25,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (153,'TECH - Determine Technology Needed for conference','Works with Committee Leadership and other Committee members to determine technology needs.',2,90,11,NULL,191,25,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (154,'REG - Participant downloads syllabus','Participants all have the option to download and print the syllabus from the website themselves.',2,96,11,NULL,57,37,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (155,'INFO - Create Information Committee','Identifies volunteers with skills needed to support the information needs of the committee.',1,36,3,NULL,NULL,13,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (157,'LEAD - Request Additional Missionaries','Send out requests for missionaries in addition to those from the Franklin 1st and Franklin Branch wards.',4,98,11,NULL,NULL,3,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (159,'INFO - Update Conference Mailing List','Ensures that all emails added to the web base during a new conference are transferred to the Mail Chimp Conference Mailing List.',1,6,1,NULL,114,15,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (160,'REG - Review Roadshow Participation','Check on whether a participant roadshow appointment is correct.',3,79,10,19,NULL,12,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (161,'LEAD - Solicit Community Volunteers','Ask for assistance from the contacts list for all kinds of help on the committee.  Assign volunteers to committees based on their interests and skills.',4,23,3,NULL,170,3,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (162,'LEAD - Transition to New Leadership Team','Participate in lessons learned meeting and provide advice as the new leadership team initiates the planning process.',2,21,2,1,NULL,3,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (163,'INFO - Update Participant Evaluation Link on Website','Person doing the survey will provide the new link.  This needs to be changed on the website so the participants can reach the current year\'s survey.',1,5,1,NULL,82,17,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (166,'LEAD - Sub-committee Lead Transition','Each sub-committee lead from the previous year, explains the role to the sub-committee lead for the following year.  This handoff should include training on how to use the web application to perform these duties.  Information on expenses for the role, which supplies or materials might be needed and where they are located.',2,26,3,3,246,NULL,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (167,'PUB - Send flyer to area Libraries and Gen. Societies','Email flyer to the libraries and genealogical socieities throughout New England.  See example wording below.',1,77,10,11,194,23,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (168,'LEAD - Invite Stake Members to Attend','Message to all Hingham Stake members to attend the conference.',1,88,11,NULL,NULL,3,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (169,'HOST - Follow-up with Speaker Hosts','Email to speaker hosts to explain to them specifically what they need to do to support their speaker(s) on the day of the conference.  The attached announcement is provided as an example.  Your message may be different depending on decisions made for your conference.',2,108,12,17,128,5,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (170,'LEAD - High Level Planning','Set up the new organization.  Make adjustments to committee role definitions, etc.  Make calling requests, for sub-committee leads to the Stake leadership.  Discuss how community volunteers will fit in.  Review budgetary constraints.',2,11,2,6,171,3,1);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (171,'LEAD - Set Objectives for Next Conference','Based on feedback from all constituents (participants, prior year\'s committee members and speakers), input from Stake Presidency and thoughts from new committee, develop measurable objectives for new conference.',2,12,2,6,NULL,1,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (194,'INFO  - Create Flyer','The flyer is usually an 8.5 x 11 version of the poster with the program schedule printed on the back.',2,194,8,NULL,37,14,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (193,'FOOD - Purchase Water for Breaks','Ensure that there is water placed on break tables in the hall ways.\r\n\r\nIn 2013 we had 6 cases of 48 count small bottles plus 1 case of 32 larger bottles for networking.  We did not have any leftover. ',4,247,12,NULL,NULL,38,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (195,'INFO - Have Syllabus Printed','Take completed file on a thumb drive to the printer and request that they print the syllabus according to the following instructions:\r\n\r\nPrint main portion of the book, in black and white, on regular paper (20 lb) - If anything needs to be in color, we need to discuss that with the speaker and with the Co-chairs - color can make the syllabus VERY expensive, not just because of the color printing, but because of hand collating that has to be done to insert the color pages.  Sometimes we have created separate handouts, but even this can be costly depending on the size of the class.\r\n \r\nPrint the cover on buff colored or ivory card stock - We may need to make a call on whether the cover is printed in color, need to get a quote to decide.\r\n \r\nProvide a blank back of the same card stock\r\n\r\nGBC bind the book\r\n\r\nThe book should cost no more than what we have advertised it for.',3,101,12,NULL,213,16,1);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (196,'PROG - Research/identify New Speakers','Through research and contacts find new speakers for the conference.  Solicit ideas from participants.',1,1,1,8,134,3,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (197,'ACCT - Setup Post Office Box','The payment reigstrar sets up a Post Office Box in a location that is convenient to him.  The PO Box will be used as the address where participants will send their checks for lunch and syllabus.',4,80,10,NULL,74,44,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (199,'LEAD - Select Sub-committee Leaders','Identify potential leaders for the various sub-committees.',1,13,6,NULL,NULL,3,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (200,'PROG - Develop Program Committee','Identifies volunteers to help on the program committee.  Understands program development requirements and trains committee members on specific tasks.  Holds sub-committee meetings as needed.  Ensures committee members have resources they need to do their tasks.',4,14,3,NULL,NULL,NULL,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (202,'LEAD - Orient Sub-committee Leaders','Ensure that all sub-committee leaders understand the overall process for creating the conference.',4,22,3,2,234,3,1);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (204,'LEAD - Orient Community Volunteers','Individual committee leads orient/train the volunteers assigned to their committee.',4,24,3,NULL,234,NULL,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (205,'PUB - Develop Publicity Committee','Identifies volunteers to help on the publicity committee.  Understands publicity requirements and trains committee members on specific tasks.  Holds sub-committee meetings as needed.  Ensures committee members have resources they need to do their tasks.',1,29,3,11,NULL,21,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (207,'HOST - Identify Lodging Providers/Transportation Providers','Create list of church members willing to host a speaker in their home for one or two nights.  Create list of church members willing to drive a speaker from or to the airport.',1,40,7,17,137,5,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (209,'LEAD - Oversee overall quality of website content',NULL,1,53,8,NULL,NULL,3,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (213,'INFO - Turns off Pre-Registration','Send email to all participants to remind them that pre-registration is clopsed, but they can still attend the conference as a walk-in.  ',3,99,12,NULL,NULL,17,1);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (218,'INFO - Support Registration Committee Registration Packet','Prints participant name tags, prints committee name tags, prints participant schedule pages, prints copies of FH Consultant Contact list, and other information needs as directed by the Registration Committee Lead.',4,100,12,9,108,18,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (221,'REG - Arrange Participant Packet Assembly Party','Works with a team to put all participant materials: * Participant Schedule * Lunch Ticket * Name Tag * Program * etc. together into an envelope with the participants name on the front.',3,111,12,NULL,NULL,9,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (224,'LEAD - Determine opening session specifics','Identify who will speak at the opening session.',4,131,12,NULL,NULL,3,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (225,'PROG - Generate Program and Print','Create the program from the website.  (New function to be added for 2014)',4,132,12,NULL,224,39,1);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (227,'LEAD - Establish Final Count of Participants','Count number of participants in chapel.  Get classroom counts from Speaker Hosts.',4,143,12,NULL,135,3,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (230,'HOST - Create/Update On-line SPEAKER Evaluation','Updates survey on Survey Monkey to meet needs of current year.  Send announcement to speakers with the link to the evaluation at Survey Monkey.  Need to make sure the link has been updated before the announcement is sent.',1,3,1,17,232,5,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (231,'LEAD - Create/Update On-line COMMITTEE Evaluation','Updates survey on Survey Monkey to meet needs of current year.  Send announcement to all committee members with the link to the evaluation at Survey Monkey.  Need to make sure the link has been updated before the announcement is sent.',1,3,1,NULL,18,13,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (233,'INFO - Provide Committee Evaluation Results','Compile results of committee evaluation and present at lessons learned meeting.',2,10,2,1,231,13,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (234,'INFO - Update Committee Handbook','Adjust committee descriptions, roles and tasks based on outcomes of Lessons Learned and Planning meetings.',4,4,2,6,5,13,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (235,'LEAD - Oversee Sub-committees','Participate in committee status meetings to offer help and ensure that all the process is moving along smoothly.',1,235,3,16,NULL,3,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (236,'PROG - Print Classroom Signage & Program','These two tasks need to be done together to ensure that they match.',1,236,11,13,126,42,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (237,'REG - Registration Soft Setup','On the Friday before the conference, set out the boxes of participant packets, make sure that each station has pens, and any other supplies needed.',4,237,12,19,120,9,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (238,'REG - Registration Soft Setup','On the Friday before the conference, set out the boxes of participant packets, make sure that each station has pens, and any other supplies needed.',4,238,12,NULL,120,9,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (239,'HOST - Arrange Speaker Gifts in Speaker Lounge','This is done as part of Soft Setup so that they are ready first thing in the morning when the speakers arrive.',4,239,12,17,131,8,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (240,'SETUP - Request Setup Period for Conference','Ensure that the calendar is completely clear for the setup period, the Thursday and Friday, before the conference.  Request that all those who might want to use the building have been notified that the building is unavailable from Thursday at 5pm through Saturday at 5pm. This includes recitals, basket ball, and all other activities.',4,240,12,13,NULL,27,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (241,'HOST - Arrange Speaker Packets','',4,241,12,17,2,5,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (242,'PARK - Setup Parking Dividers for Speakers, etc.','Place cones and ropes to indicate exactly where speakers should park.',4,242,12,10,NULL,30,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (243,'SETUP - Setup Roadshow Room(s)','These are small classrooms where a genealogist can meet one-on-one with a participant.  May also be held in the family history center.',4,243,12,15,116,27,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (244,'SETUP - Special Screen Arrangement for Cultural Hall Side B','The Cox family created a mechanism so that we can have a full sized screen in Cultural Hall Side B.  ',4,244,12,14,NULL,27,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (245,'SETUP - Setup Planning','',2,245,11,13,116,27,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (246,'REG - Inventory Registration Supplies & Materials','It is very helpful to have an updated inventory of what is left over from the previous year.  All supplies and materials should be left in the box on the shelf in the Franklin Family History Center.',1,246,1,19,18,9,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (247,'FOOD - Cater Speaker Lounge','Provide light breakfast snacks for the speakers for example, fruit and banana bread. ',4,145,12,18,NULL,43,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (248,'ACCT - Reconcile Finances','Finalize all financial matters having to do with the conference.',4,248,12,21,249,45,1);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (249,'ACCT - Collect Payments on Conference Day','Collect payments on conference day.',4,249,12,16,114,45,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (250,'FOOD - Create Food Sub-committee','Identifies volunteers to fill the food committee roles, see FOOD Committee main page.',3,250,7,NULL,202,38,0);
INSERT INTO `task_objs` (`id`, `name`, `description`, `month_week`, `seq_no`, `month_month_id`, `meeting_meeting_id`, `predecessor_task_obj_id`, `committee_role_committee_role_id`, `key_task`) VALUES (251,'FOOD - Scope Other Fund Raiser','Agree on what will be provided as a secondary fund raiser.',2,251,7,18,250,46,0);
/*!40000 ALTER TABLE `task_objs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_objs_documents_documents`
--

DROP TABLE IF EXISTS `task_objs_documents_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_objs_documents_documents` (
  `document_dest_id` int(11) NOT NULL DEFAULT '0',
  `task_obj_src_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`document_dest_id`,`task_obj_src_id`),
  KEY `fk_task_objs_documents_documents_sid` (`task_obj_src_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_objs_documents_documents`
--

LOCK TABLES `task_objs_documents_documents` WRITE;
/*!40000 ALTER TABLE `task_objs_documents_documents` DISABLE KEYS */;
INSERT INTO `task_objs_documents_documents` (`document_dest_id`, `task_obj_src_id`) VALUES (10,90);
INSERT INTO `task_objs_documents_documents` (`document_dest_id`, `task_obj_src_id`) VALUES (15,114);
INSERT INTO `task_objs_documents_documents` (`document_dest_id`, `task_obj_src_id`) VALUES (18,166);
INSERT INTO `task_objs_documents_documents` (`document_dest_id`, `task_obj_src_id`) VALUES (18,170);
INSERT INTO `task_objs_documents_documents` (`document_dest_id`, `task_obj_src_id`) VALUES (18,202);
INSERT INTO `task_objs_documents_documents` (`document_dest_id`, `task_obj_src_id`) VALUES (18,204);
INSERT INTO `task_objs_documents_documents` (`document_dest_id`, `task_obj_src_id`) VALUES (29,89);
INSERT INTO `task_objs_documents_documents` (`document_dest_id`, `task_obj_src_id`) VALUES (29,90);
INSERT INTO `task_objs_documents_documents` (`document_dest_id`, `task_obj_src_id`) VALUES (29,91);
INSERT INTO `task_objs_documents_documents` (`document_dest_id`, `task_obj_src_id`) VALUES (30,236);
INSERT INTO `task_objs_documents_documents` (`document_dest_id`, `task_obj_src_id`) VALUES (31,4);
INSERT INTO `task_objs_documents_documents` (`document_dest_id`, `task_obj_src_id`) VALUES (32,16);
INSERT INTO `task_objs_documents_documents` (`document_dest_id`, `task_obj_src_id`) VALUES (32,232);
INSERT INTO `task_objs_documents_documents` (`document_dest_id`, `task_obj_src_id`) VALUES (32,233);
/*!40000 ALTER TABLE `task_objs_documents_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_objs_resources_resources`
--

DROP TABLE IF EXISTS `task_objs_resources_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_objs_resources_resources` (
  `task_obj_src_id` int(11) NOT NULL DEFAULT '0',
  `resource_dest_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`task_obj_src_id`,`resource_dest_id`),
  KEY `fk_task_objs_resources_resources_did` (`resource_dest_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_objs_resources_resources`
--

LOCK TABLES `task_objs_resources_resources` WRITE;
/*!40000 ALTER TABLE `task_objs_resources_resources` DISABLE KEYS */;
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (2,25);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (4,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (16,1);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (20,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (21,3);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (23,5);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (26,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (27,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (28,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (29,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (30,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (32,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (35,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (37,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (47,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (49,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (57,2);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (58,4);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (58,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (59,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (61,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (62,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (63,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (67,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (74,2);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (75,2);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (76,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (78,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (80,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (82,1);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (83,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (86,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (88,6);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (88,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (94,24);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (95,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (100,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (101,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (102,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (103,3);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (103,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (106,3);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (106,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (108,3);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (108,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (109,3);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (110,16);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (111,3);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (111,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (113,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (113,10);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (113,11);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (113,12);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (121,14);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (126,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (127,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (130,14);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (131,15);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (134,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (136,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (144,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (153,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (154,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (159,2);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (160,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (162,5);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (163,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (166,5);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (166,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (170,5);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (170,19);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (194,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (199,5);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (202,5);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (202,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (204,5);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (204,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (209,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (213,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (218,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (224,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (225,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (227,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (230,1);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (231,1);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (232,1);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (233,1);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (234,5);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (236,7);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (242,17);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (246,12);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (246,16);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (248,21);
INSERT INTO `task_objs_resources_resources` (`task_obj_src_id`, `resource_dest_id`) VALUES (249,22);
/*!40000 ALTER TABLE `task_objs_resources_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volunteers`
--

DROP TABLE IF EXISTS `volunteers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volunteers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `l_name` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `f_name` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `full_name` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_confirmed` tinyint(1) DEFAULT NULL,
  `user_name` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwd` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line1` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line2` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zipcode` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cell_phone` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home_phone` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `work_phone` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `missionary_ind` tinyint(1) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volunteers`
--

LOCK TABLES `volunteers` WRITE;
/*!40000 ALTER TABLE `volunteers` DISABLE KEYS */;
INSERT INTO `volunteers` (`id`, `l_name`, `f_name`, `full_name`, `email`, `email_confirmed`, `user_name`, `passwd`, `address_line1`, `address_line2`, `city`, `state`, `zipcode`, `cell_phone`, `home_phone`, `work_phone`, `missionary_ind`, `created_at`) VALUES (1,'Mello','Manny','Manny Mello','manny@mello.org',1,'mmello','mmello','','','','','','508-717-5555','','',0,'2012-10-29');
INSERT INTO `volunteers` (`id`, `l_name`, `f_name`, `full_name`, `email`, `email_confirmed`, `user_name`, `passwd`, `address_line1`, `address_line2`, `city`, `state`, `zipcode`, `cell_phone`, `home_phone`, `work_phone`, `missionary_ind`, `created_at`) VALUES (2,'Lyons','Sylvia','Sylvia Lyons','grovest8@hotmail.com',1,'slyons','slyons','','','','','','508-446-6154','508-947-8394','',0,'2012-10-29');
INSERT INTO `volunteers` (`id`, `l_name`, `f_name`, `full_name`, `email`, `email_confirmed`, `user_name`, `passwd`, `address_line1`, `address_line2`, `city`, `state`, `zipcode`, `cell_phone`, `home_phone`, `work_phone`, `missionary_ind`, `created_at`) VALUES (3,'Wild','Diana','Diana Wild','dianawild@gmail.com',1,'dianaparticipant','weldd9',NULL,NULL,NULL,NULL,NULL,'401-465-4659','401-658-5220',NULL,NULL,'2012-10-29');
INSERT INTO `volunteers` (`id`, `l_name`, `f_name`, `full_name`, `email`, `email_confirmed`, `user_name`, `passwd`, `address_line1`, `address_line2`, `city`, `state`, `zipcode`, `cell_phone`, `home_phone`, `work_phone`, `missionary_ind`, `created_at`) VALUES (4,'Matteson','Judy','Judy Matteson','jamshm@aol.com',1,'jmatteson','jmatteson',NULL,NULL,NULL,NULL,NULL,'617-650-1680','781-337-7308',NULL,NULL,'2012-10-29');
INSERT INTO `volunteers` (`id`, `l_name`, `f_name`, `full_name`, `email`, `email_confirmed`, `user_name`, `passwd`, `address_line1`, `address_line2`, `city`, `state`, `zipcode`, `cell_phone`, `home_phone`, `work_phone`, `missionary_ind`, `created_at`) VALUES (19,'TRUSCOTT','Frank','Frank Truscott','',0,'frank admin','Ftruscott','','','','','','','','',0,'2013-06-02');
INSERT INTO `volunteers` (`id`, `l_name`, `f_name`, `full_name`, `email`, `email_confirmed`, `user_name`, `passwd`, `address_line1`, `address_line2`, `city`, `state`, `zipcode`, `cell_phone`, `home_phone`, `work_phone`, `missionary_ind`, `created_at`) VALUES (6,'Allen','Linn','Linn Allen','linnallen@gmail.com',1,'lallen','lallen',NULL,NULL,NULL,NULL,NULL,'781-298-1355',NULL,NULL,NULL,'2012-10-29');
INSERT INTO `volunteers` (`id`, `l_name`, `f_name`, `full_name`, `email`, `email_confirmed`, `user_name`, `passwd`, `address_line1`, `address_line2`, `city`, `state`, `zipcode`, `cell_phone`, `home_phone`, `work_phone`, `missionary_ind`, `created_at`) VALUES (17,'Howe','Michelle','Michelle Howe','michellehowe107@msn.com',1,'','','','','','','','','','',0,'2013-04-17');
INSERT INTO `volunteers` (`id`, `l_name`, `f_name`, `full_name`, `email`, `email_confirmed`, `user_name`, `passwd`, `address_line1`, `address_line2`, `city`, `state`, `zipcode`, `cell_phone`, `home_phone`, `work_phone`, `missionary_ind`, `created_at`) VALUES (8,'Hawley','Dennis','Dennis Hawley','dennis.hawley@verizon.net',1,'dhawley','dhawley',NULL,NULL,NULL,NULL,NULL,'401-641-2311','508-543-1181',NULL,NULL,'2012-10-29');
INSERT INTO `volunteers` (`id`, `l_name`, `f_name`, `full_name`, `email`, `email_confirmed`, `user_name`, `passwd`, `address_line1`, `address_line2`, `city`, `state`, `zipcode`, `cell_phone`, `home_phone`, `work_phone`, `missionary_ind`, `created_at`) VALUES (9,'Lewis','Walter','Walter Lewis','lewis.walter83@yahoo.com',1,'wlewis','wlewis',NULL,NULL,NULL,NULL,NULL,'617-335-2603',NULL,NULL,NULL,'2012-10-29');
INSERT INTO `volunteers` (`id`, `l_name`, `f_name`, `full_name`, `email`, `email_confirmed`, `user_name`, `passwd`, `address_line1`, `address_line2`, `city`, `state`, `zipcode`, `cell_phone`, `home_phone`, `work_phone`, `missionary_ind`, `created_at`) VALUES (10,'McDougall','Wayne','Wayne McDougall','w.mcdougall@gmail.com',1,'wmcdougall','wmcdougall',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2012-10-29');
INSERT INTO `volunteers` (`id`, `l_name`, `f_name`, `full_name`, `email`, `email_confirmed`, `user_name`, `passwd`, `address_line1`, `address_line2`, `city`, `state`, `zipcode`, `cell_phone`, `home_phone`, `work_phone`, `missionary_ind`, `created_at`) VALUES (11,'Meredith','Gloria','Gloria Meredith','photography@gloriameredith.com',1,'gmeredith','gmeredith',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2012-10-29');
INSERT INTO `volunteers` (`id`, `l_name`, `f_name`, `full_name`, `email`, `email_confirmed`, `user_name`, `passwd`, `address_line1`, `address_line2`, `city`, `state`, `zipcode`, `cell_phone`, `home_phone`, `work_phone`, `missionary_ind`, `created_at`) VALUES (12,'Moessing','Connie','Connie Moessing','clmoessing@netscape.net',1,'cmoessing','cmoessing',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2012-10-29');
INSERT INTO `volunteers` (`id`, `l_name`, `f_name`, `full_name`, `email`, `email_confirmed`, `user_name`, `passwd`, `address_line1`, `address_line2`, `city`, `state`, `zipcode`, `cell_phone`, `home_phone`, `work_phone`, `missionary_ind`, `created_at`) VALUES (13,'Robert','Jean Caude','Jean Claude Robert','jean_robert02302@yahoo.com\ncadestin4@msn.com',1,'jcrobert','jcrobert',NULL,NULL,NULL,NULL,NULL,'508-649-6491',NULL,NULL,NULL,'2012-10-29');
INSERT INTO `volunteers` (`id`, `l_name`, `f_name`, `full_name`, `email`, `email_confirmed`, `user_name`, `passwd`, `address_line1`, `address_line2`, `city`, `state`, `zipcode`, `cell_phone`, `home_phone`, `work_phone`, `missionary_ind`, `created_at`) VALUES (14,'Stone','Heather','Heather Stone','theswissgirl@gmail.com',1,'hstone','hstone',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2012-10-29');
INSERT INTO `volunteers` (`id`, `l_name`, `f_name`, `full_name`, `email`, `email_confirmed`, `user_name`, `passwd`, `address_line1`, `address_line2`, `city`, `state`, `zipcode`, `cell_phone`, `home_phone`, `work_phone`, `missionary_ind`, `created_at`) VALUES (15,'Martin','David','David Martin','dave.martin@htproducts.com',1,'dmartin','','','','','','','','','',0,'2013-04-14');
INSERT INTO `volunteers` (`id`, `l_name`, `f_name`, `full_name`, `email`, `email_confirmed`, `user_name`, `passwd`, `address_line1`, `address_line2`, `city`, `state`, `zipcode`, `cell_phone`, `home_phone`, `work_phone`, `missionary_ind`, `created_at`) VALUES (16,'Hielner','Dane','Dane Hielner','',0,'','','','','','','','','','',0,'2013-04-15');
INSERT INTO `volunteers` (`id`, `l_name`, `f_name`, `full_name`, `email`, `email_confirmed`, `user_name`, `passwd`, `address_line1`, `address_line2`, `city`, `state`, `zipcode`, `cell_phone`, `home_phone`, `work_phone`, `missionary_ind`, `created_at`) VALUES (18,'Burger','Andrew','Andrew Burger','andrewaburger@gmail.com',1,'aburger','aburger','','','','','','','','',0,'2013-05-24');
/*!40000 ALTER TABLE `volunteers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_functions`
--

DROP TABLE IF EXISTS `website_functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_functions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `link` mediumtext COLLATE utf8_unicode_ci,
  `seq_no` int(11) DEFAULT NULL,
  `task_task_obj_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_website_functions_task_task_obj_id` (`task_task_obj_id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_functions`
--

LOCK TABLES `website_functions` WRITE;
/*!40000 ALTER TABLE `website_functions` DISABLE KEYS */;
INSERT INTO `website_functions` (`id`, `name`, `description`, `link`, `seq_no`, `task_task_obj_id`) VALUES (1,'Speaker Registration','This function allows anyone with administrator credentials to register a speaker so they can update information about themselves and their presentations and monitor their class participation.\r\n\r\nThis should be the first step in adding a speaker to the system.  Click on Speaker Registration, all you have to do is add their name, username and password.  Next, send them their username and password.  Tell them they can change ther username and password if they wish.  Ask that they login and check their information.','http://www.nefamilyhistory.com/speakers/register',NULL,134);
INSERT INTO `website_functions` (`id`, `name`, `description`, `link`, `seq_no`, `task_task_obj_id`) VALUES (2,'Edit Speaker Status Checklist','This function enables the user to monitor which information has been collected from each speaker.\r\n\r\nThis page allows tracks whether we have collected all information for each speaker.','http://www.nefamilyhistory.com/admin/speaker_status',NULL,134);
INSERT INTO `website_functions` (`id`, `name`, `description`, `link`, `seq_no`, `task_task_obj_id`) VALUES (3,'Edit Speaker Needs Checklist','This function enables the user to monitor the needs of the speaker','http://www.nefamilyhistory.com/admin/speaker_needs',NULL,134);
INSERT INTO `website_functions` (`id`, `name`, `description`, `link`, `seq_no`, `task_task_obj_id`) VALUES (4,'Roadshow Appointment Participation','This function allows the speaker and registration committees to monitor how the roadshow is being received.','http://www.nefamilyhistory.com/road_show_appts/list',NULL,160);
INSERT INTO `website_functions` (`id`, `name`, `description`, `link`, `seq_no`, `task_task_obj_id`) VALUES (5,'Class Roster Emails','This function provides email lists for each class.  Should there be an issue with a class, for example, the speaker cannot speak, the registration committee lead can email all the participants in that class and tell them to select another class.','http://www.nefamilyhistory.com/admin/by_class_emails',NULL,73);
INSERT INTO `website_functions` (`id`, `name`, `description`, `link`, `seq_no`, `task_task_obj_id`) VALUES (6,'Payment Processing','This function enables the Payment Registrar to document that a check has been received from a participant, indicate which participant(s) are covered by the payment and create a deposit slip for a set of payments.','http://www.nefamilyhistory.com/payments/new',NULL,101);
INSERT INTO `website_functions` (`id`, `name`, `description`, `link`, `seq_no`, `task_task_obj_id`) VALUES (7,'Change Participant Password','This function allows anyone with administrator credentials to change a participants password.','http://www.nefamilyhistory.com/admin/change_user_password',NULL,106);
INSERT INTO `website_functions` (`id`, `name`, `description`, `link`, `seq_no`, `task_task_obj_id`) VALUES (8,'Change Speaker Password','This function allows anyone with administrator credentials to change a speaker\'s password.','http://www.nefamilyhistory.com/admin/change_speaker_password',NULL,145);
INSERT INTO `website_functions` (`id`, `name`, `description`, `link`, `seq_no`, `task_task_obj_id`) VALUES (9,'REPORT: Roadshow Appointments by Room','This report is used as part of the classroom signage.','http://www.nefamilyhistory.com/road_show_appts/list_by_room',NULL,130);
INSERT INTO `website_functions` (`id`, `name`, `description`, `link`, `seq_no`, `task_task_obj_id`) VALUES (10,'REPORT: Overall Statistics','This report is used to monitor all the counts for the lunches, paper syllabus and classroom capacity, etc.','http://www.nefamilyhistory.com/admin/stats',NULL,33);
INSERT INTO `website_functions` (`id`, `name`, `description`, `link`, `seq_no`, `task_task_obj_id`) VALUES (11,'REPORT: Bulk E-Mails','We will be using MailChimp for very large bulk emails such as the SAVE-the-DATE.  These lists will be used to maintain the MailChimp lists.','http://www.nefamilyhistory.com/admin/contact_emails',NULL,NULL);
INSERT INTO `website_functions` (`id`, `name`, `description`, `link`, `seq_no`, `task_task_obj_id`) VALUES (12,'REPORT: Contact Mailing Lists','We will be using MailChimp for very large bulk emails such as the SAVE-the-DATE. These lists were used previously for this purpose.',NULL,NULL,NULL);
INSERT INTO `website_functions` (`id`, `name`, `description`, `link`, `seq_no`, `task_task_obj_id`) VALUES (13,'REFERENCE: Freq Asked Questions','The frequently asked questions appear on the public website and provide information about the conference like Why can\'t I bring coffee into the building?, and Why are Mormons so into genealogy?  The answers to these questions may need to be adjusted from time to time or a new question might need to be added.  The function supports these needs.\r\n\r\nThis list may appear with no text, click on \"show text\" in green to see the text.','http://www.nefamilyhistory.com/freq_asked_questions/list',NULL,67);
INSERT INTO `website_functions` (`id`, `name`, `description`, `link`, `seq_no`, `task_task_obj_id`) VALUES (14,'REFERENCE: Topics','All presentations are classified by topic to make it easier to review the presentations over time.  This function provides the ability to add new topics or change the names of existing topics.','http://www.nefamilyhistory.com/topics/list',NULL,30);
INSERT INTO `website_functions` (`id`, `name`, `description`, `link`, `seq_no`, `task_task_obj_id`) VALUES (15,'REFERENCE: Rooms','Each room that is used by the conference is named and given a letter designation.  These letters are used as part of the classroom signage.  The room record also indicates the capacity of the room for the purposes of assigning rooms to presentations.','http://www.nefamilyhistory.com/rooms/list',NULL,126);
INSERT INTO `website_functions` (`id`, `name`, `description`, `link`, `seq_no`, `task_task_obj_id`) VALUES (16,'REFERENCE: Sandwich Choices','The lunch menu has one optional aspect and that is the sandwich choice.  The choice has always been ham or turkey, but this could change or we could opt to add Vegetarian as a formal option.  This function allows us to make this change.  A participant who chooses to purchase lunch selects a sandwich type when they register.  There is a count, by sandwich choice, in the Overall Statistics report.  These counts are used to determine how much of each to purchase.','http://www.nefamilyhistory.com/sandwich_choices/list',NULL,90);
INSERT INTO `website_functions` (`id`, `name`, `description`, `link`, `seq_no`, `task_task_obj_id`) VALUES (17,'REFERENCE: Tracks','The vertical slice of presentations through the program is called a track, we try to keep a speaker in the same room if they are presenting more than once.  All presentations in a given track are often in the same room, even if the speaker changes.  Tracks are designated by a letter, they do not appear anywhere but in the system for organizational purposes.  This functions allows anyone with administrator credentials to add, change or delete a track.','http://www.nefamilyhistory.com/tracks/list',NULL,37);
INSERT INTO `website_functions` (`id`, `name`, `description`, `link`, `seq_no`, `task_task_obj_id`) VALUES (18,'REFERENCE: Sessions','The horizontal dimension in the program grid is called a session.  Sessions are defined by time.  A session is generally about 50 minutes to allow for 10 minutes between classes and plenty of time for lunch.  This function allows anyone with administrator credentials to change the times for the sessions.  We have never had a need to add a session, but if that was needed it would be done here.','http://www.nefamilyhistory.com/sesions/list',NULL,37);
INSERT INTO `website_functions` (`id`, `name`, `description`, `link`, `seq_no`, `task_task_obj_id`) VALUES (19,'Events','The event is the core of the system.  An event is a conference.  The event record stores all the high level information about a conference: the date, the location, the lunch menu, etc.  The event is created as soon as possible as everything else is related to the event.','http://www.nefamilyhistory.com/events/list',NULL,90);
INSERT INTO `website_functions` (`id`, `name`, `description`, `link`, `seq_no`, `task_task_obj_id`) VALUES (20,'Speakers','This function is used to document contact information for a speaker, to add their bio and picture and any special needs they may have.','http://www.nefamilyhistory.com/speakers/list',NULL,134);
INSERT INTO `website_functions` (`id`, `name`, `description`, `link`, `seq_no`, `task_task_obj_id`) VALUES (23,'Payments','This is a record of a check that has been send by a participant.','http://www.nefamilyhistory.com/payments/list',NULL,101);
INSERT INTO `website_functions` (`id`, `name`, `description`, `link`, `seq_no`, `task_task_obj_id`) VALUES (24,'Deposits',NULL,NULL,NULL,NULL);
INSERT INTO `website_functions` (`id`, `name`, `description`, `link`, `seq_no`, `task_task_obj_id`) VALUES (25,'Contacts',NULL,NULL,NULL,NULL);
INSERT INTO `website_functions` (`id`, `name`, `description`, `link`, `seq_no`, `task_task_obj_id`) VALUES (26,'Create Event','An event is a conference.  All the basic information that describes the event is contained in the event object.',NULL,1,NULL);
INSERT INTO `website_functions` (`id`, `name`, `description`, `link`, `seq_no`, `task_task_obj_id`) VALUES (27,'Populate Contacts from Participants','This function moves all the contact information from the participants (which are only kept for the duration of the conference) to the contacts list which is our on-going email list.',NULL,2,NULL);
INSERT INTO `website_functions` (`id`, `name`, `description`, `link`, `seq_no`, `task_task_obj_id`) VALUES (28,'Download Participant List (CSV)','Go to the participants list on the website and click on \"Select an Action...\"  Select \"Download to CSV\".  This will put all the information about the participants into a file that can be opened with Excel.  ','http://www.nefamilyhistory.com/participants/list',3,65);
INSERT INTO `website_functions` (`id`, `name`, `description`, `link`, `seq_no`, `task_task_obj_id`) VALUES (29,'Payment Outstanding Email List','This function provides a list of all those participants who have registered but have not paid, i. e., they have not send a check directly or they have not been covered by someone else.  If this information is not correctly documented in the system, this list will be incorrect and people who have paid will get the reminder.',NULL,4,100);
INSERT INTO `website_functions` (`id`, `name`, `description`, `link`, `seq_no`, `task_task_obj_id`) VALUES (30,'Edit Presentation Schedule','Provides the ability to set the session (time) and track (vertical) for each presentation.','http://www.nefamilyhistory.com/admin/room_assignments_form',5,37);
INSERT INTO `website_functions` (`id`, `name`, `description`, `link`, `seq_no`, `task_task_obj_id`) VALUES (31,'Create Roadshow Appointments','This function is organized by speaker and shows the user the spaces in the schedule when a speaker could possibly have a roadshow appointment.',NULL,6,27);
INSERT INTO `website_functions` (`id`, `name`, `description`, `link`, `seq_no`, `task_task_obj_id`) VALUES (32,'Add/Update Lunch Menu','Allows the lunch lead to change the items that will be included in the packed lunch.  Login using your admin username and password.  Go to the Events object and click on the number next to the word \"Events\".  You will get a list with the year at the left.  Click on the conference year.  Scroll down to the menu field (9th field from the top).  Make the needed changes.  Click on the \"Save Changes\" button.  The changes will now appear on the main page of the website.','http://www.nefamilyhistory.com/events/list',32,NULL);
INSERT INTO `website_functions` (`id`, `name`, `description`, `link`, `seq_no`, `task_task_obj_id`) VALUES (33,'Presentations','The program is made up of a set of scheduled presentations given by speakers.','http://www.nefamilyhistory.com/presentations/list',33,37);
INSERT INTO `website_functions` (`id`, `name`, `description`, `link`, `seq_no`, `task_task_obj_id`) VALUES (34,'Participants','This is a list of all those who have signed up for the conference for the current year.  The quality of the information in this list is critical to the registration process and is maintained by the registration committee.  Contact information from this list will be synced with our Mail Chimp mailing list so that we can contact all of our past participants for future conferences.','http://www.nefamilyhistory.com/participants/list',34,108);
INSERT INTO `website_functions` (`id`, `name`, `description`, `link`, `seq_no`, `task_task_obj_id`) VALUES (36,'Webmaster Functions','Turn on pre-registration\r\nTurn on download capability\r\nTurn off pre-registration\r\nSet website to \"UNDER CONSTRUCTION\"\r\n\r\nAt this time, these functions can only be done by the web developer.','',36,57);
INSERT INTO `website_functions` (`id`, `name`, `description`, `link`, `seq_no`, `task_task_obj_id`) VALUES (37,'Print Classroom Signage','Prints out classroom signs based on the room assignments for the classes.','',37,236);
INSERT INTO `website_functions` (`id`, `name`, `description`, `link`, `seq_no`, `task_task_obj_id`) VALUES (38,'Print Program','A master copy of the program is printed from the website and then copied on colored paper on the Franklin Library copy machine.  The copying can be done while setup is on-going.\r\n\r\nA copy of a draft of the program should be provided to all setup team members.','',38,236);
/*!40000 ALTER TABLE `website_functions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-06-08 22:15:57
