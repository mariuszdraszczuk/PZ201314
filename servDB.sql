CREATE TABLE `notes` (
  `noteid` INT NOT NULL AUTO_INCREMENT,
  `cr_date` DATETIME,
  `mod_date` DATETIME,
  `note` TEXT(10000),
  PRIMARY KEY  (`noteid`)
);

CREATE TABLE `tags` (
  `tagid` INT NOT NULL AUTO_INCREMENT,
  `tag` TEXT(100),
  PRIMARY KEY  (`tagid`)
);

CREATE TABLE `tag_to_notes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tagid` INT,
  `noteid` INT,
  `userid` INT,
  `userid` INT,
  `userid` INT,
  PRIMARY KEY  (`id`)
);

CREATE TABLE `users` (
  `userid` INT NOT NULL AUTO_INCREMENT,
  `mail` TEXT(100),
  `pass_hash` TEXT(100),
  PRIMARY KEY  (`userid`)
);



ALTER TABLE `tag_to_notes` ADD CONSTRAINT `tag_to_notes_fk1` FOREIGN KEY (`tagid`) REFERENCES tags(`tagid`);
ALTER TABLE `tag_to_notes` ADD CONSTRAINT `tag_to_notes_fk2` FOREIGN KEY (`noteid`) REFERENCES notes(`noteid`);
ALTER TABLE `tag_to_notes` ADD CONSTRAINT `tag_to_notes_fk3` FOREIGN KEY (`userid`) REFERENCES users(`userid`);
ALTER TABLE `tag_to_notes` ADD CONSTRAINT `tag_to_notes_fk4` FOREIGN KEY (`userid`) REFERENCES users(`userid`);
ALTER TABLE `tag_to_notes` ADD CONSTRAINT `tag_to_notes_fk5` FOREIGN KEY (`userid`) REFERENCES users(`userid`);