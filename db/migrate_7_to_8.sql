/* ["-d", "fhc_committee_development", "-e", "MyISAM", "-i", "c:\\ruby_web_apps\\Rails2x\\fhc_committee\\db\\tdefs_7.csv", "-t", "c:\\ruby_web_apps\\Rails2x\\fhc_committee\\db\\tdefs_8.csv"] */

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

use fhc_committee_development ;

--
-- Remove constraints
--

ALTER TABLE `task_objs_documents_documents` DROP FOREIGN KEY `fk_task_objs_documents_documents_did` ;
ALTER TABLE `task_objs_documents_documents` DROP FOREIGN KEY `fk_task_objs_documents_documents_sid` ;
ALTER TABLE `committees` DROP FOREIGN KEY `fk_committees_oversight_role_assignment_id` ;
ALTER TABLE `role_assignments` DROP FOREIGN KEY `fk_role_assignments_volunteer_volunteer_id` ;
ALTER TABLE `role_assignments` DROP FOREIGN KEY `fk_role_assignments_committee_role_committee_role_id` ;
ALTER TABLE `role_assignments` DROP FOREIGN KEY `fk_role_assignments_event_event_id` ;
ALTER TABLE `committee_roles` DROP FOREIGN KEY `fk_committee_roles_committee_committee_id` ;
ALTER TABLE `task_objs_resources_resources` DROP FOREIGN KEY `fk_task_objs_resources_resources_sid` ;
ALTER TABLE `task_objs_resources_resources` DROP FOREIGN KEY `fk_task_objs_resources_resources_did` ;
ALTER TABLE `meetings_resources_resources` DROP FOREIGN KEY `fk_meetings_resources_resources_did` ;
ALTER TABLE `meetings_resources_resources` DROP FOREIGN KEY `fk_meetings_resources_resources_sid` ;
ALTER TABLE `announcements` DROP FOREIGN KEY `fk_announcements_task_task_obj_id` ;
ALTER TABLE `meetings` DROP FOREIGN KEY `fk_meetings_facilitator_committee_role_id` ;
ALTER TABLE `meetings` DROP FOREIGN KEY `fk_meetings_month_month_id` ;
ALTER TABLE `meetings_invitees_committee_roles` DROP FOREIGN KEY `fk_meetings_invitees_committee_roles_did` ;
ALTER TABLE `meetings_invitees_committee_roles` DROP FOREIGN KEY `fk_meetings_invitees_committee_roles_sid` ;
ALTER TABLE `website_functions` DROP FOREIGN KEY `fk_website_functions_task_task_obj_id` ;
ALTER TABLE `task_objs` DROP FOREIGN KEY `fk_task_objs_meeting_meeting_id` ;
ALTER TABLE `task_objs` DROP FOREIGN KEY `fk_task_objs_month_month_id` ;
ALTER TABLE `task_objs` DROP FOREIGN KEY `fk_task_objs_committee_role_committee_role_id` ;
ALTER TABLE `task_objs` DROP FOREIGN KEY `fk_task_objs_predecessor_task_obj_id` ;

--
-- Process renaming and type migrations
--


--
-- Drops and adds of tables and columns
--




ALTER TABLE `task_objs` ADD COLUMN `commitee_committee_id` int ;

--
-- Apply constraints
--

ALTER TABLE `task_objs_documents_documents` ADD CONSTRAINT `fk_task_objs_documents_documents_did` FOREIGN KEY (`document_dest_id`) REFERENCES `documents` (`id`) on delete cascade ;
ALTER TABLE `task_objs_documents_documents` ADD CONSTRAINT `fk_task_objs_documents_documents_sid` FOREIGN KEY (`task_obj_src_id`) REFERENCES `task_objs` (`id`) on delete cascade ;
ALTER TABLE `committees` ADD CONSTRAINT `fk_committees_oversight_role_assignment_id` FOREIGN KEY (`oversight_role_assignment_id`) REFERENCES `role_assignments` (`id`) on delete set null ;
ALTER TABLE `role_assignments` ADD CONSTRAINT `fk_role_assignments_volunteer_volunteer_id` FOREIGN KEY (`volunteer_volunteer_id`) REFERENCES `volunteers` (`id`) on delete set null ;
ALTER TABLE `role_assignments` ADD CONSTRAINT `fk_role_assignments_committee_role_committee_role_id` FOREIGN KEY (`committee_role_committee_role_id`) REFERENCES `committee_roles` (`id`) on delete set null ;
ALTER TABLE `role_assignments` ADD CONSTRAINT `fk_role_assignments_event_event_id` FOREIGN KEY (`event_event_id`) REFERENCES `events` (`id`) on delete set null ;
ALTER TABLE `committee_roles` ADD CONSTRAINT `fk_committee_roles_committee_committee_id` FOREIGN KEY (`committee_committee_id`) REFERENCES `committees` (`id`) on delete cascade ;
ALTER TABLE `task_objs_resources_resources` ADD CONSTRAINT `fk_task_objs_resources_resources_sid` FOREIGN KEY (`task_obj_src_id`) REFERENCES `task_objs` (`id`) on delete cascade ;
ALTER TABLE `task_objs_resources_resources` ADD CONSTRAINT `fk_task_objs_resources_resources_did` FOREIGN KEY (`resource_dest_id`) REFERENCES `resources` (`id`) on delete cascade ;
ALTER TABLE `meetings_resources_resources` ADD CONSTRAINT `fk_meetings_resources_resources_did` FOREIGN KEY (`resource_dest_id`) REFERENCES `resources` (`id`) on delete cascade ;
ALTER TABLE `meetings_resources_resources` ADD CONSTRAINT `fk_meetings_resources_resources_sid` FOREIGN KEY (`meeting_src_id`) REFERENCES `meetings` (`id`) on delete cascade ;
ALTER TABLE `announcements` ADD CONSTRAINT `fk_announcements_task_task_obj_id` FOREIGN KEY (`task_task_obj_id`) REFERENCES `task_objs` (`id`) on delete set null ;
ALTER TABLE `meetings` ADD CONSTRAINT `fk_meetings_facilitator_committee_role_id` FOREIGN KEY (`facilitator_committee_role_id`) REFERENCES `committee_roles` (`id`) on delete set null ;
ALTER TABLE `meetings` ADD CONSTRAINT `fk_meetings_month_month_id` FOREIGN KEY (`month_month_id`) REFERENCES `months` (`id`) on delete set null ;
ALTER TABLE `meetings_invitees_committee_roles` ADD CONSTRAINT `fk_meetings_invitees_committee_roles_did` FOREIGN KEY (`committee_role_dest_id`) REFERENCES `committee_roles` (`id`) on delete cascade ;
ALTER TABLE `meetings_invitees_committee_roles` ADD CONSTRAINT `fk_meetings_invitees_committee_roles_sid` FOREIGN KEY (`meeting_src_id`) REFERENCES `meetings` (`id`) on delete cascade ;
ALTER TABLE `website_functions` ADD CONSTRAINT `fk_website_functions_task_task_obj_id` FOREIGN KEY (`task_task_obj_id`) REFERENCES `task_objs` (`id`) on delete set null ;
ALTER TABLE `task_objs` ADD CONSTRAINT `fk_task_objs_meeting_meeting_id` FOREIGN KEY (`meeting_meeting_id`) REFERENCES `meetings` (`id`) on delete set null ;
ALTER TABLE `task_objs` ADD CONSTRAINT `fk_task_objs_month_month_id` FOREIGN KEY (`month_month_id`) REFERENCES `months` (`id`) on delete set null ;
ALTER TABLE `task_objs` ADD CONSTRAINT `fk_task_objs_committee_role_committee_role_id` FOREIGN KEY (`committee_role_committee_role_id`) REFERENCES `committee_roles` (`id`) on delete set null ;
ALTER TABLE `task_objs` ADD CONSTRAINT `fk_task_objs_commitee_committee_id` FOREIGN KEY (`commitee_committee_id`) REFERENCES `committees` (`id`) on delete set null ;
ALTER TABLE `task_objs` ADD CONSTRAINT `fk_task_objs_predecessor_task_obj_id` FOREIGN KEY (`predecessor_task_obj_id`) REFERENCES `task_objs` (`id`) on delete set null ;

--
-- end of migration
--

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

