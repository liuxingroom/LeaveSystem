/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.0.27-community-nt : Database - db_leavesystem
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_leavesystem` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `db_leavesystem`;

/*Table structure for table `act_evt_log` */

DROP TABLE IF EXISTS `act_evt_log`;

CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL auto_increment,
  `TYPE_` varchar(64) collate utf8_bin default NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `TIME_STAMP_` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `USER_ID_` varchar(255) collate utf8_bin default NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) collate utf8_bin default NULL,
  `LOCK_TIME_` timestamp NULL default NULL,
  `IS_PROCESSED_` tinyint(4) default '0',
  PRIMARY KEY  (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_evt_log` */

/*Table structure for table `act_ge_bytearray` */

DROP TABLE IF EXISTS `act_ge_bytearray`;

CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `DEPLOYMENT_ID_` varchar(64) collate utf8_bin default NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_bytearray` */

insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('150004',1,'StudentLeaveProcess01.png','150003','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0Ì\0\0?\0\0\0-;Ç:\0\08öIDATxœíİql$g}?~Jê¨D¹¶ª‚¥ı#V)œÕ İ54¦Rs®J‹¥\"pù#µ®‚ÒS…¨Õ\n®*¤§ª…K…R«U¾u…Y\"€KuK®I¸\\ærG.	&É§¹Ëmîìóüæv“Ífwg¼ë}¼3³ûzé‘µŞ™Ï<¿½^ïE\0\0@PCYo\0\0\0ô!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0z¤\\.ÏÎÎNNN•J¥¡Aï{|&&&fffVVV².l	!\0za~~>—qÂ¾ùæ›¿~ÛmÇ?·º:˜#Ş÷ø<xğšk®‰Iµ³.„\'dÀÖZYY™ššÚ½{÷‰GOœ[=gÔ\'Ÿz2ÚñÁY^^ÎºP’\r\0[(NØ£££Ÿ¿ésçVÏ\ZIã–/ß²sçÎ¥¥¥¬ËÁÙ\0°…¦¦¦*	ûy#}|ı¶[¯ºê7³.#dÀV™ŸŸß½ûêÕµ²ÑÎøÈŸøúë?uÑ !\0¶D¹\\.•J>¶´ºvÆhgœ:ı“;Şº¸¸˜ué \0!\0¶ÄÌÌÌÔÔÔêÚsµñöñw´ù&wõ÷\Z¨qıõ===ué \0!\0¶ÄÄÄÄÁ/şÇK	ûêİ?Š¢GÎG­Fß=İw6ºçÔÚ/~ãk=s×¹èËÑ]åèöç¢[Ÿşáö®ÛóşÌón&ãÛ‡f]:@È€-122òàƒ÷®®®¡¡¡SQtz=zf-zú\\ô\\ıÙ_|lè¢Wïºzâ±ÕèÄÙèÄóÑR9:¶}á[÷UÌ>=€ãÔé“ÃÃÃY—²`KlÛ¶í©“­®ª87?w>:{şÂMkë¾~é+ÿù‹¿òkù‰¿_‹¢g×¢gV£§W£•(ºõîû+!ûÔ`xß³-á< +I‘(åÇ=ŞÂ¬T‚ò³µ{z-:y&:wş…VVV>õéÏ~üï>}âñŸÃ²º«„ï;¿}_Ã}jÎBsĞ•v\"Qû±©Ÿ¢y%(ÿ_m\\Ùç£\'Ÿ‹~|*Z¢sgÏ\\~ùĞĞ+‡††ßõ‡×ÔßñÃ÷6Üw Fk\rÍœÇ\0t¥›ıÕë^Ğ×}u“kÎ³JP~¦6ª/9y&züÙè‰ç£{üÁë^÷ºWşÔÅ—\\öšÉ÷¾,dßıíÃ\r÷¨QôºC•ó€®l>dÇû…pıÒ¥N×œg• ¼Rñ·gÖ£§ËÉ~òùè¶»ß²ãŠ×üÂk/Ûö³Ÿı×/<E§ÎFÏ½pÇÛİİpß\ZE¯;T9èÌ†ïñÜò.©«ìÛ½¶ö“Ú¨îNœ³ŸY~r.züÙÕ;XÚñëo{ûoÿÎg£—£\'ÊÑÉ³Q³o¿ëî†ûÔ(zİ¡Êy@W’Ru›AüØ\rWÖ^.²‰øg\rAyìíWİÿ½‡îy`ñĞ‘Å;/ŞqïÑ;ï?ş_w}÷[<ü?‡~óğ÷ï¸÷û‡î;úÀC?üÌ?İôî÷¼;ó°+dC7œÇ\0l^5m˜Š6\\ åSÙE[•ıtıøÀŞ¿á/±?x×»\Zî8P£èu‡*ç1\0›*d»áÊ+o8¶‰5çY%dŸ4:….:Ô8Ø¤ú0”ŒZßZ÷ôuó3Ù}²Ï?et:\n]t¨q°Iİ†ìº·ğkù4v;kÎ³JÈ~Òèt·âPÏyÀf4\'¡”lÔQlêhÍyV	ÙO‚–\Z8èLÊ}4ßÔÑƒt´æü«„ìÂ\ZZrÀæÍÎÎ.--µ¼©²—N‡MpÀ&=z´úû¥—^zğàÁ†[…l!›Aæ<€M*—Ë]tQ5g¿êU¯zó›ß\\ÿ¬v%dÿ(àØp…İ/°á’µë›/ÜÍìJ\nÁ8`ó¶oß^ÿ92—\\rÉµ×^‡ï¨²ÏŸ¼›Q[míÛú+[®?ıAnmXyº†54_5„lúƒó`°Äùoaaaß¾}c/*•J,6çüùÇºõ+©]ŞÜšëïŞ¼yéël~è”İïrÖ³pŠ8[OLLÇÁ:Ù/Jú¿=ÚqÙe—Õ2ëDE|x£É~´ËQ]Iı×úµo“S~ãª’¾mù¸ÍWÖVÛ¼1Aö·º¬«\n8úßòòrõIë¹¹¹¬·¥¯¬¬¬TCçÈÈÈûŞ÷¾øëììlíÖJè<Ñå¨®¤şkı…¤å[^ßpSó’©a½ñ^\r·ÙÙÚš3¬)„â<èsóóóqø[XXÈzCúĞ#<2<<<>>^*•¦§§ãÌ]k%wş°›ñò ûÃÚ\nSÖÜò¦†»\'-YÍ†—ë/t¿§\r›‘UA! ç1@?›››ká™™™–/¹	=ëóqík}òn\'d7¬ªÕÕ™¾åõ‘ºÄ/d3ÈœÇ\0}+N~£££vV*éó‘.Ç‹¡ö…Ë\rê—IÇ/[,åÛ†kZ^ngc‚ìrÖ¥ƒ\0œÇ\0}k×®]‡Êz+×…ô¹¾Ôå¨_IírÊšÛ¿©yÉ´°¼\rAv³a3².à<èOsssYoÅ@«¤Ï‡»/fÜ‡ë×–²æöoj^2é!Z^®mUÃ5Av9ëÒA\0Îc€ş4>>>??ŸõV´JèüA7ãÅûÂåúëSîÒæMé›—tkıöT/·ÜÂ.÷:ëÒA\0Îc€>´¼¼¼}ûö¬·bĞUBçñ £¶ª¦Wq4^Óê•¯$å®¬_IÃõ¡öWÈ¦?8ú×ŠäA%t3:B6ıÁyĞ‡öîİ{àÀ¬·bĞUBöCF§CÈ¦?8úĞØØ˜OŸÉœ-d3ÈœÇ\0}È›÷åA××\Z!›şà<èC¥R©ågÒK•ı}£Ó!dÓœÇ\0}hÛ¶m>è1s•½ht:„lúƒó ‰)yP	Ùß3:Î^úƒó ‰)y0<<|æÌ½ëëß5:\ZÎ^úƒó ‰)yP*•~økëë\Z\rg/ıÁyĞ‡Ä”<ÿêüëÑwŒöÇ÷¿422’ué \0] 	Ùy°ÿşéék3­Å\Zÿ2ó‰©©©¬KèÂ\0}HÈÎƒ¥¥¥‘‘7)ß³=`´9&&~knn.ëÒA\0º0@²sbß{Ö£ûvÆ¿ÏşíääxÖEƒ0ta€>$dçD¹\\{Û¡CÿE÷écyù¶‘‘7­¬ÜuÑ ] 	Ùù±¸¸8:zùââ\\1’Fœ°ãßF>—u¹ ] 	Ù¹rèĞ¡8gïßÿ\'Qt¯Ñ<ææ>92RZXøç¬!éÂ\0}HÈÎ›r¹<==56vÅÌÌ_-/ß\ZE‡••ÿı›ÉÉİcñåúÃ555uàÀø eU/è.Ğ‡„ì|ZXX˜šú½íÛ~ˆ¡¡mÛ.œ¼:ÎÙÍjiiiïŞ½¥RIÔ¦¸ta€>4$dS|ËËË¢6Å¥ô!!›¾!jSPº0@²é3¢6…£ô!!›¾TÚÛ·oß·oßÊÊJÖ›ita€>$dÓÇâx‡ìR©$j“gº0@²é{¢69§ô!!›!j“[º0@²(õQ{yy9ëÍta€>$d3€jQ{ïŞ½¢6™Ó…úÍÀ*—ËµÉœ.Ğ‡„lœ¨Mæta€>$dC$j“)] 	ÙPS‹Ú{öìYZZÊzsº0@²¡Aµo¼ñÆ8jOMM‰Úô€.Ğ‡„lH233#jÓºp!Å¿ÏÎÎNNNÅbhPÅû‰‰‰¸cöÓg¨oU¿Ö·7†„ì\\2»«ò0»Em¶š.\\<óóóq_ˆ{ôÍ7ßüõÛn;vüø¹ÕÕÁñ¾ÇGààÁƒ×\\sM|Lâ™uqPßş®oÏ	Ùùcvçpv‹Úl]¸Hâ_÷ãF°{÷î8·zÎ¨O>õdÜ¬ãƒSÜÿWßş®o	Ù¹bvç|vW£vüûÏ‘#G²Úú.\\qıüMŸ;·zÖH\Z·|ù–;wñ		õíïúöfwQf÷ììl\\©‰‰	Q› táÂ˜ššªôèçôñõÛn½êªßÌº\\Sßş®oï	ÙùavkvÏÍÍ‰Ú¡ÃüüüîİW¯®•vÆGşüÃ×_ÿñ¬‹ÖõíïúfBÈÎ	³» ³[Ô¦{ºp”ËåR©ôècK«kgŒvÆ©Ó?Ù±ã­‹‹‹Y—®-êÛßõÍŠfwÑg·¨M7tá˜™™™ššZ]{®6Ş>ş6ß&©ş^5®¿ş¯§§§³.][Ô·¿ë›!;Ìîş˜İÕ¨=66¶°°õ¶P$ºpÄ¿Cüâ¼Ô£¯Şı£(zä|ôĞjôİ³Ñ}g£{N­øâ7¾öØ3w‹ş·İUn.ºõùènàº=ïÏ¼cf2¾}øPÜ³.][Ô·¿ë›‰ê{YxsñÌ™İı4»ã„=V!jÓ&!»\0FFF|ğŞÕµÓÕ144t*ŠN¯GÏ¬EOŸ‹‹¢?û‹\r]ôê]WO<¶\Z8x>Z*GÇÖ¢/|ë¾ÊÓ!§pœ:}rxx8ëÒµE}û»¾½gë«®ºêó7İ§9;[fwÿÍnQ›öõmÈ.—Ësssûöí›˜˜{Ñøøx|Íììl±~ğlÛ¶í©“­®ª¸ó>w>:{şÂMkë¾~é+ÿù‹¿òkù‰¿_‹¢g×¢gV£§W£xo½ûşJ›>5˜£(.Wßş®oUö=ß>|nu-ş*ggËìî×Ùİ›¨’dfff|h@şåı<Ş„øŒŒOÁø÷àø¤ŒOÄƒ¿øõÛ¾Q·|ù+ıèÇ&\'\'ãÆ·k×®¢|€\\¥Õ>[ñ·§×¢“g¢sç_X ş!ú©Oöã÷é_˜r«ëÑ¹Jû¾óÛ÷5Üw FşÛt•úö¬¾µ»4¿şµåbIwÏ­ú„]ÊÙù?¼›`v÷lvg¢µçççÃ®9N2q†Ùğ…û£££7ŞxcœÅÃ>:¡ã<nÓ‘#Gâs=>/ã0]û“4n¿ãÎk®ù£øÍÿ_|*­öÿjãB›>=ù\\ôãSÑj;{väòË‡†^944ü®?¼¦ş÷¾·á¾5ŠÒ¦Õ·—õ­¿W}æNY,ıÊühNØ=ÎÙ)Q eú»ozÍ¹ev÷rvg%Nãããqœˆ“qµíÚµkÃx]¯T*yh‚+Òyœnÿşıñ)şõÛ¾±a¼nøñÿXÚ³gO¬´Úgjc¨òÇ“g¢ÇŸx>ºçÁ¼îu¯{åO]|Ée¯™|ïËÚôİß>Üpß\ZEiÓê›a};\njy>£’öÖåì¯^÷Âøë¾ÚâÖôÄÜòšê×c7\\YŸ®¼áXûkÎ!³;ÃÙİcG™˜˜H‰Ú;vì¸òÊ+S¦aœC¦¦¦\Zt¼Â|äÏëÿ&~ôc»wïnX2~ôBüÍj ï<nŸ—“““ÓÓÓÅëúñŸùLü(·/oª´Ú•Úˆ¿=³=]¾ğ\\È“ÏG·İ½ø–W¼æ^{Ù¶Ÿıì¿~áù(:u6zîì…;Ş~èî†ûÔ(J›VßŞ×·å³A›^,sé	{Krv±_×/]ª—t †’ÿ’Ğx—q»ƒ5ç“ÙİûÙ­¤¨O½jyë[ßÚr\ZÆ	¤á	ì}èO?2©Ÿ|êdœ^¶oß^»K©Tò~Ş¹RÔó¸&NØñy9;;»é„]{õH¼¥¥¥¬w¨…xæ¬­ı¤6ªİ\'îÔÏ¬F?9=şìê,íøõ·½ı·ç‰³ÑËÑåèäÙ(nÔ·ßuwÃ}j¥M«oÏê[KÉ\rñ®áBJæŞ\\‰·T;	{+_7ÒAÈNú¥¥eÈn½Ş¼V!‰Ùİ³Ù+ÍQûSŸúTõ„ík_ûÁ~°aù8{Äù¸6)ÆÇÇÓãuCÔşèG?V»ïğğğ¡C‡z¾Ç´Vìó8699Ù}Â®ıŠsv_7ÒĞjÇŞ~Õıß{èY¼ãğâ÷½óşãÿu×w¿õÀÃÿsøè7ÿ{¿è¾£<ôÃÏüÓMï~Ï»3o—Út:õíe}ky.ı)êæğå2ŞµŸ°·\"gW_ÚQÂ-i›‡·EÈWıâ+E:ZsŞ˜İ½œİyS‹Ú333¿üË¿\\;c_ÿú××?ß\\}®°vë\'®¿~ææ›ÿ_¯«kˆóznÿ2?hŠ}ïß¿¿›W‰4ƒ¿O‰¬w«Q¥M?]?>ğ÷oøƒ\'öïzWÃj¥M«o/ë;´Ñ3ÙÍß&-“¹Nö=Ÿİò)çôcÕòh×_¯³ùÕØí¬9oÌî^Îî|ŠóôÈÈH}q/¾øâ+®¸¢¶Àäädí¦8„tóDá¶mÛªë‰çx†»LMÏãøÄA˜°«ãºëŞã7f½s/SiÓ\'NGQÚ´úö²¾C>“å5do.aoÑóÙ\r¸94×®oyØ›–Oz©HâšsËìîåìÎ§øÃÍ§ıŞğ†ê›ÏÍÍÕ®ÜÜsØõã–/¥¶¶d½ë9dÇ	{s?`ÒÇ‰G{ãK¹zÑÈ…6}ş)£ÓQ”6­¾½¬ïPçÏd§_™‰æ„ÿp½üò‘¤×q>ùÔÉ;v|ş¦›‚åìºÜœˆ7ŒÂ-öKW6Çö¶×œ7fw/gw>MOO·üõrdd$ª$™ê·ãããA2LíõÙÛ·oÏU’LE=«ïÓ<aWÇ‡>ô§¹ú°Ò¦Ÿ4:EiÓêÛËú¶ÙéÏdGuOÁn²ÆAµLØÕ—c¾ñ¥æœ]MØÕí˜³koá×òiìæËIË´¸2á‰ìvÖœ7fw/gwQ,--MMM•J¥={öT\'Q<O<úX\0óì©Óµ÷Ù»woÖû:èŠzÇ?:}KìÌÏÑ¬wñ%•6ı„Ñé(J›Vß^Ö·{åùéÒ”„]Õ³ëvğœİ¬ù %åéæß[Òx›kÎ³»—³»pâÙWúĞŸÌ0ñ¯®vÛ¶mYïâ +äyÿHˆO-JØÕ±sçÎü¼	N¥MÿØèt¥M«oÏê[ÿ¼uKQÓÓ¥-—ÉJsÂ®Öª9g7\'ì¡¦çÌBåì”ƒSl“kçîİ”fwÏfwáÔŞ9;êiìÚˆ›@uÍùÿLëşVÈóxfffjjjKCö\'®¿~zzº—;5;;›ô.İ•6½lt:rÕ¦Õ·¿ëÛ¥”Ó£&åSÓko)PŸ³ß{oË„}Ë—¿Ò¼†Ş|îz¿2»Íî$)çFœdª³2}Á3Ìu×½ğ&6=N24(äy¼gÏo¼qKCö×oûF/ßçèÑ£Õùpé¥—<x°áVmºèmZ}û»¾]J?=ª6üÔôæœ}ñÅ·“°åì.™İfw’ôs£ö‚ìîßT¤e†©®|×®]™ì;U…<ÇÇÇ“~T„\ZÇãK=Û£r¹|ÑEU§Ä«^õª7¿ùÍõ¿ûVÚôºµõ4üèMYrÃëÛ_²›µmz{VÁt½©oG‡zs‡}Ãr7_ØÒÊ®¤!¥ŸQÛŸšŞœ³ÛLØrv7¶zv·ìÕIÍ³a™$IëOù¡ĞãĞ³;ıÜˆ“Lõ¦­È3q†©®¼Tê]’¡Y!Ïã-zó¾úñì©ÓñÏ¤^îTÃ+/¹ä’k¯½¶úş;ñ·çÏ?Şı¨­§~…I+O¿>©w×/VeËeÚÜ’nö·—L×ƒú6ì{ıÑn¿\nµÅšë˜Rñ”[7rUß.¥œ}jzRÎŞ0aËÙİ;»[N±æe’®Ùp¦OÿóMm9“Ğ7³;åÜ¨½yßå™Úƒf}Z!~|Öÿ/–\'hí?3wşücİÚzZ®|sÛĞòúê•õ_7Ü†à;[}ˆüT0]¨]N*ÍPİaßğÄØ°¾)«M¹°;X”úv#NØí¿“Ò-ü÷+_ùÊ†5¼â¯¸é¦is\rÕWÊ\rÂí™ S¸áúÚšS±ÍMJ_ }û‡¶¬\rÀì®åï¤··ïrÔÖŸudh…<ú###ßyğÁ„ì^îÔe—]V›{q‹Y\\\\Œ^x.äÑnFóô®¿i‹ÖYÿµùá’¶¡û­_U/+˜nKë›´ûÍUhùXÍL_gÊİ›h‹ö.oõíRÊéqäÈ‘8g?ùÔÉ\r[VË÷©jùşÙ-×?nüˆY‚ÙŠÙÔ9“¦U;×„ê*=è\0}3»SÎÚg­oQ©½³gÖÇ` òèoé›dWG_“]{+ŸxÖ½ï}ï‹¿ÎÎÎÖn­4©İÚzšÂqëÅ\Z.×î˜´pÃ2õëo~¸–Q åöt³¿=«`ºŞÔ·eë¿¶¬WÒ•\rM¯TË²n¸æ¾©o—ÒO¨½œ’°«6ÌÙöælÅìNïŠ\rS;iá”‡n9aSfw;Ë„í\0C}1»ÓÏÚSõ[‘gâé\\]¹·ÊÎV!Ïã©©©úÏSØŠqûwîÜ¹³g{ôÈ#Ä¿t—J¥ééé†×DVúÔ»í¬§y™†kªß&÷Ü—-Óæ%]î~{VÁt½©oÃ¾×¥¡4ÍËlXÍ6/×_ØŠıÊg}»”~zT¥çì–	û¯xEÃ5)9[ÂŞ´-İ-çQı¤n9õÚ™ãÍ7?D† ?fwú¹\'™êQúÇÏ|&x†ùÎƒVW>::šÕî4d8p ìÇ#58Ä_sÍõr§æææfffZ¾¡f¨°Rëzé\r·¹u¦7Ó¤†[¿ò–•Şıƒìo/+˜®õmŞıæ¯-rúOÜv*U_è”UßÁ—q«¤œ5I9;égşáÿûtË÷Ïnù¹ëv7¶bv§ÏÓtv‰\r/÷¾ôÍìN97öïß_=nqØa>qıõÕ•ONNö|§yI!Ïãø|/ÜÒ½{÷îùùù¬wô•nõH7£®\'¾ìÊ”å“¨]Ùªá&Ş½ş^)ë;ŠÒ¦·n÷›û†5M¯NRMÛ| Á¬o@Í9;)aWßK$ésj\Z>w]ÂŞ:›˜Í­µ6ÛæÔJş)°éË[Ñav/..V]<IŸ=u:l†‰EuåqÄÏzGZQÏã-ıßÇøtOúê›ìäÁ…nµ¾Ôı¨­§zá¥®ºpúJZ.ß¼ş¤‡NüAh³.][BíoJ“ª–²dı5–©yı[´SE¬oXÍ9ûškş¨¾(\rïÖ×œ³wïŞ]û‰.aoµ.\'Bz›M™˜möØ¤¹ßşmQÙ]*•ªGòàÁ/Ì0µ7ÉyGÎlõ<ŞÒWŒüı\'?¯<ë]|I¥[=Üı¨­§z!eµ)Ô¯¤©á¦İ½a™–ë;ŠÒ¦·n÷›‘RÓ†Ó£å]6¼\\[UÒÚ°¾Á¥äì¤OM¯ål	»Ç6wş7OŸ†éÖ<»“–LZsRH¿KÏ:À€Ìîßıİß­«;v|2û÷ßùÎêj\'&&²ŞÅAWÔó¸\\.Ç¿nÅ»eÇ\'úßXZ^^Îz_RiR?è~ÔÖS½Ğrµ/6ÇÖßÖ_Ó|}Ãåôk’îp¥MoÅî×®¹éEoyMz¥ê«¡Ö[TÜÕw+´ÌÙéŸšçl	»÷6qş\'MØ–-·y¢¥tæ–ó±ıéßËĞO³ûÃşğÏıÜÏ\r5ùéŸşé÷¾÷½µw³õáê·ßqgí!LğÌø<}÷{ŞÓ÷OcG/´éã]{ßñÚ×zõ¤Ü·v÷úÍ÷­ æ%[®¿ûl¹Ú¬K×–-Úıæz5T|Ç?©|)gÅÖí]Qê»EšsvúçÆ}çÁ%ìŞëôüOé«Í·6OÉ\rÛxúúÛ™ì½é\0ı4»ã7~c¨ÉÈÈÈÿñG•?ËW¯‰Iîş½ü?^Kí{öìÉz×)rÈış;ßö•LñÏ¡ê_m²Ş³—©4©cF§£(mZ}û»¾[§ıÏ©©v/™İf÷ÒÒRıGÒÄŞñw”J¥Úÿ}íÚµ«z}œ»ùôÇ8ºÔş\r:^U®ş ?°Š}¯¬¬ìÜ¹3Ô@VÿO?>Å³Ş­F•6ıÑé(J›Vßş®ï–ê4gKØ=fv›İq˜¾îºëjï[¿mÛ¶ñññ¹¹¹Úq\n¯ı×DÓÿ$•4N<úX-a/,,d·Ç¼¤ğçñââbœ³»ùå¯ö³ç÷ßùÎ[¾ü•¬w¨mº¿Û´úöw}·ZGŸ».a÷˜Ù=È³;×(•JSSSµ¼ÿıïCvÃ’q&®=ÏGäN?æö;î¬½J$?h&ûK³~8ãŸñ/pñI¶é„ıŒ“z>vTiÓëëGNGQÚ´úöw}{ ÍÏ]—°{ÏìÌÙ]‹×{÷î­¾lcvv6Ş©÷¾÷½»víZ\\\\l¾ËÜÜ\\ı»mÆ©&éÿ˜À~÷{ŞSÿZ	;WŠ}×¬¬¬Ä?c>úÑuúòÄgOşûO~²úš“¬w\"Q¥Mßèt¥M«o×·76üÜu	;f÷ Íîæx]»şg~ægFFFR¦a¾ãêsµã`ÓüšØ8[ÿãg>³{÷îú…ãŒîU\"ySÔó¸Y|Ççâå—Ä¡¹Í÷›üüM7ÅËèC\ZÿÊzóÓTÚô¢Ñé(J›Vßş®oÏ¤|îº„³{pfwR¼®‰ğ†ÿŒ¸²²²oß¾ááá¡VvîÜ™tÓää¤ÿtÌ¡âÇéâ“,>¿ãßç~ÿïŒ3tó?Ä×Ü|óÿ{÷{Ş/sÍ5´´´”õ&o¬Ò¦¿gt:ŠÒ¦Õ·¿ëÛK-?w]ÂÎÙ=³;NÆû÷ïO‰×ŠW255Õ2L7‹\'ø¡C‡ºP¶B‘ÎãöÅ¿PÎÍÍÅçhíŸmëÿø\'ìÙÙÙ}Öhü›ë™3÷®¯×èh¥M«o×·Çês¶„9³»¿gwõ‰ç8^OOO\"9N2qV‰“ÌèèhC’‰qbbâÆoôìuÎã<pñtzøá¯­¯?ht4ŠÒ¦Õ·¿ëÛ{Õœ}ìøq	;sfw¿ÎîZ¼¿öì9»8p÷æ%ïç1±ñññ¯Îß¸}Çh|oñK###Y—®-êÛßõÍDœ­ãÿvæÌîş›İ™ÄëØ]wİÿîQ ?Â	Ù…°ÿşéék3o|Å\Zÿ2ó‰¢üÒ¯¾ı]ß¬8>y`v÷ÓìÎ*^W½á\roˆCö?øÁ?.İ²`iiidäMgÊ÷¬Gm‰‰ßªÿH­<Sßş®oVòÿ÷A`v÷Çì®¾§BVñ:vÃ\r7T_ıú×¿Ş_¨\nD.†}ìYî7Úÿ>û·““©•gêÛßõÍ„fw¡gw-^8p «—jÄ[{ç¾‹/¾øŠ+®Èd3Ø]¸ÊåòØØÛú·(ºÏHËË·Œ¼ieåö¬‹ÖõíïúfBÈÎ	³» ³»>^ÇEÌpK&&&êßZä\roxÃÌÌL†ÛCûtáÂX\\\\½|qq.ŠI#îÑñÏ³……Ïe]®©o×·÷„ìü0»‹5»ó¯£ÊÓØÍïıK¿ôK™oíĞ…‹äĞ¡Cq§Ş¿ÿO¢è^£yÌÍ}rd¤´°ğÏYj“Ô·¿ëÛcBv®˜İ…˜İ¹Š×UŸûÜçªÁú-oyK-dÿê¯şªOP/]¸`âi?==56vÅÌÌ_-/ß\ZE‡••ÿı›ÉÉİcñå¬KÔõíïúö’7fwg÷ÒÒÒÔÔÔöíÛó¯«¾ùÍo¾úÕ¯sÿ¶mÛâI½½âµ¯}­]ºp!Å³kjê÷¶oÿù6?vµ¿mÛvéääÕq§Îº,Á¨o½ş«oo	Ù¹dv×ËÃì®Æë8Åæö…ÎG‰72zqRÇ—½ÁHQèÂ@¢|¾[-í²!Uşãu“ºpH¤§—ÚA’ÂÅë*“ºpH¤§—ÚA³ÅÅÅ\"Æë*“ºpH¤§—ÚA½#GLLLŒŒŒ1^W™Ô…£`@\"=½¸Ôªªñztt4oŸÖŞ)“ºpH¤§—ÚAßÄë*“ºpH¤§—Ú1Èú,^W™Ô…£`@\"=½¸ÔÁ´°°ĞñºÊ¤.ééÅ¥vš8^Uô_¼®2©GÁ€Dzzq©ƒ£¯ûûÃÆMêÂQ0 ‘^\\jÇ x]eR‚‰ôôâR;úÛ@Åë*“ºpH¤§—ÚÑ¯ææævíÚ5PñºÊ¤.ééÅ¥vôŸ8^NLL:t(ëmÉ€I]8\n$ÒÓ‹Kíè\'µx}äÈ‘¬·%3&uá(HO/.µË§r¹<;;;99966V*•†U¼ïñˆCóÌÌÌÊÊJÊ¯k†Lê¢Q0 ‘^\\j—Cóóóq¸ŒöÍ7ßüõÛn;vüø¹ÕÕÁñ¾ÇGààÁƒ×\\sM|Lâ¨İ|¸Äë&uá(HO/.µË••••©©©İ»wŸxôÄ¹ÕsFıxò©\'ã¨œååå¬•k&uá(HO/.µË8a~ş¦Ï[=k$[¾|ËÎ;—––².W~™Ô…£`@\"=½¸Ô.?¦¦¦*	ûy#}|ı¶[¯ºê7³.W~™Ô…£`@\"=½¸Ô.\'æççwï¾zu­l´3>òç¾şúg]´œ2©GÁ€Dzzq©]”ËåR©ôècK«kgŒvÆ©Ó?Ù±ã­‹‹‹Y—.LêÂQ0 ‘^\\j—333SSS«kÏÕÆÛÇßÑæ›ÜÕßk Æõ×ÿõôôtÖ¥Ë#“ºpH¤§—ÚåÁÄÄÄÁ/şÇK	ûêİ?Š¢GÎG­Fß=İw6ºçÔÚ/~ãk=s×¹èËÑ]åèöç¢[Ÿşáö®ÛóşÌón&ãÛ‡f]º<2©GÁ€Dzzqõ²vI•ò4mÏ¶-[###>xïêÚéêˆwüT^Y‹>=EöºèÕ»®xl5:q6:ñ|´T­E_øÖ}•\'³Oà8uúäğğpÖ¥Ë£Á™8}CÁ€Dzzqå!dwºLmÉ¾‰æÛ¶m{êäc«k§ª#Ş…çÎGgÏ_¸imıÂ×/}å?ñW~í/?ñ÷kQôìZôÌjôôj´E·Ş}%dŸ\ZÌQÄZ÷€ÃR8\n$ÒÓ‹«!ûØ\rWÖgè+o8¶‰5çY%(?[ñ·§×¢“g¢sç_X`eeåSŸşìÇÿîÓ\'¿ğ9,«ëÑ¹Jø¾óÛ÷5Üw FÑë¾E–ÂQ0 ‘^\\ÃÃÃår¹7à™ìqûº¯njÍyV	ÊÿWBöùèÉç¢ŸŠV£èÜÙ³#—_>4ôÊ¡¡áwıá5õw¼çğ½\r÷¨Qôºo‡¥pH¤§W©TÚºÏÛè1Zœ6éçÒW¯k±‹V‚ò3µQ}¹ÈÉ3ÑãÏFO<İóà^÷º×½ò§.¾ä²×L¾÷e!ûîon¸ï@¢×}‹8,…£`@\"=½¸FGG9Ò›ÇJJÕíñc7\\ùâ+E6ßó¬”Wj#şöÌzôtùÂ3ÙO>İv÷â[v\\ñš_xíeÛ~ö³ÿú…ç£èÔÙè¹³îxû¡»î;P£p…î\r‡¥pH¤§×ØØØÂÂB¨z’lxª¤,ğÕëZ¼\Z{Ã{B¼ıkk?©êîÄ9û™Õè\'ç¢ÇŸ]½ó¥¿ş¶·ÿöï<q6úq9z¢<Å1ûö»în¸ï@¢×}‹8,…£`@\"=½¸¦¦¦fffzğ@]‡ì¤—Š´»æ<kÊco¿êşï=tÏ‹‡,Şqxñ{Şyÿñÿºë»ßzàáÿ9|ô›‡¿Ç½ß?tßÑúágşé¦w¿çİ™‡]!;W–ÂQ0 ‘^\\ÕÏ\ZÜêG©?CÒÏ–Ä[ë^+Òò.…>	+!ûéúñ¼Ã—ÄÄşà]ïj¸ã@B}ë8,…£`@\"=½¸GFF¶úQ„ì„\'²Û_sUBöI£ÓQÜŠo)‡¥pH¤§ÚVÿïcóé‘rÂtt.u´æ<»²Ï?et:\nZî­æ°‚‰ôôB;pàÀŞ½{·bÍ)oôÑ|SGoÒÑšó¯²Ÿ4:…+to8,…£`@\"=½ĞÊår©TZ^^ÎzCW%d?at:t––ÂQ0 QûÏ>¦\\ÙüO]í<„\'A,,,Œe½ƒ«²lt:Lÿ––ÂQ0 Q7!»áúúÌİÎİı8	eß¾}[ô¢ªfgg“>\\³²—N‡éß’ÃR8\n$Jÿ?¶$éwéş¡éÔôôôøøøÊÊJÖÒ‡=Z=±/½ôÒƒ6Ü*dÙ9,…£`@¢.ŸÉ®İÚNï(¯Ó©ùùùR©´oß>/Ñ«\\._tÑEÕÓõU¯zÕ›ßüæúgµ+!ûG]ÚJ\ZÖ–´ò”ms\rm®?iÃ‚ìrv%Í/‡¥pHÔMÈ®¥äæŠ5½\\{ÓMûVVVâGíñññøBo>t}lß¾½ş7ÃK.¹äÚk¯ÃwT9ÏŸ¼ûQ[Oó…”eRÖ“ômºö7¦ûıÍºªyä°‚‰’zú†?Œëï²@Ã£Ô_ïÇÉ‰Ãßüü|²ÇÆÆ6¬#İ;ş±nFûë¯]NyĞ†;6,™¾µÍëO¹Ğı^g=QòÈa)µÓÓk?³“î>”üLvó·IË@n]vÙeµY0Qÿ³¸¸½ğLö£İŒô5ÔßšœÂ[,_½Ğ¼À†]¿Ú†µm¸µíuÖUÍ#‡¥pH´aO¯ÑÍuøLv$dS4+++ÕSzddä}ï{_üuvv¶vk%tè~$¤ç—-Ğòrú2õ_S¨ááj—n\rµ³ÕUeXÓÜrX\nGÁ€Dé=½9·LÏm.ÖÑCCN<òÈ#ÃÃÃããã¥Rizzºá-\\*¹ó‡ÁGÃjÓ¿my}õríšæí\\®¿vOMÿ––ÂQ0 QROox6ºárC˜nş6=d·|¶rknnnff¦å[eoEÈŞp-¨OÕ)Ù:õ™ìÖ/“Í…ì­ã°‚‰Úìé)Y¼ÍûúáA_ª¤ÏGº)©÷Å°›¶dóÚj_ë/4,r¹~µ)ëé~¯³.]9,…£`@¢nBöPİóÖ-E­o^ŠëBú\\_\n8ÚYaú2õ·6/™–æ›îÕ|!ànf]º<rX\nGÁ€Dz:t£’>8ÚYaÊ2Õ›j4/YÍ†—kkKYá¦w3ëÒå‘ÃR8\n$ÒÓ¡•Ğùƒ€£&-S}õ¼¯_vM¨İÌºtyä°‚‰ôtèF%t2ê^¶‘xSò+=7ß±y™æ’«y”õlng³.]9,…£`@\"=ºQ	ÇŒN‡ÎÓ’ÃR8\n$ÒÓ¡•ıÑéĞyZrX\nGÁ€Dz:tCÈ²rX\nGÁ€Dz:t#AëëGN‡ÎÓ’ÃR8\n$ÒÓ¡•ı}£Ó¡ó´ä°‚‰ôtèF%d/\Z§%‡¥pH¤§C7*!û{F§CçiÉa)ééĞááá3gî]_ÿ®ÑÑĞyZrX\nGÁ€Dz:t£T*=üğ×Ö×4:\Z:OKKá(HO‡nŒuşÆõè;Fûã{‹_\ZÉºty¤!‚‰ôtèÆşıû§§¯Í<¶küËÌ\'¦¦¦².]iÈ…£`@\"=º±´´42ò¦3å{Ö£Œ6ÇÄÄoÍÍÍe]º<ÒGÁ€Dz:tiß{Ö£ûvÆ¿ÏşíääxÖEË)\r¹pH¤§C—ÊåòØØÛú·(ºÏHËË·Œ¼ieåö¬‹–S\Zrá(HO‡î-..^¾¸8EGŒ¤\'ìø·‘……Ïe]®üÒGÁ€Dz:qèĞ¡8gïßÿ\'Qt¯Ñ<ææ>92RZXøç¬•k\Zrá(HO‡PÊåòôôÔØØ33µ¼|k6VVş{vöo&\'wOLŒÅ—³.QŞiÈ…£`@\"=ÂZXX˜šú½íÛ~ˆ¡¡mÛ.œ¼:ÎÙY—¥†4ä¢Q0 ‘\Zrá(HOÈ	\r¹pH¤§ä„†\\8\n$ÒÓrBC.éé\09¡!‚‰ôt€œĞGÁ€Dz:@NhÈ…£`@\"= \'4äÂQ0 ‘\Zrá(HOÈ	\r¹pH¤§ä„†\\8\n$ÒÓrBC.éé\09¡!‚‰ôt€œĞGÁ€Dz:@NhÈ…£`@\"= \'4äÂQ0 ‘\Zrá(HOÈ	\r¹pH¤§ä„†\\8\n$ÒÓrBC.éé\09¡!‚‰ôt€œĞGÁ€Dz:@NhÈ…£`@\"= \'4äÂQ0 ‘\Zrá(HOÈ	\r¹pH¤§ä„†\\8\n$ÒÓrBC.éé\09¡!‚‰ôt€œĞGÁ€DÃÃÃår9ë­\0@È.•J¥¥¥¥¬·\0!»xH4::zäÈ‘¬·`Ğ-//oß¾=ë­ 3B6hlllaa!ë­\0tKKK¥R)ë­ 3B6hjjjff&ë­\0tóóóãããYo²DqÂsvÖ[0èöUd½tFÈ-..ŒŒd½\0ƒn|||~~>ë­ 3B6Æÿ>dkyy¹T*yCÕÂ²4Ø»woÖ[0¸ôá‚²4år¹T*-//g½!\0ƒH..!ØÀÂÂÂØØXÖ[0ˆ¼ËSq	ÙÀÆöíÛç•\0=vàÀ={öd½l’\r´ezzz|||ee%ë\rèåryjjJÂ.4!h×üü|©TÚ·oŸWl‘•••ÄÍÖ«DŠNÈ:wÿ8dÇİ||<¾àC×‚ˆÛéşıû\'&&â»wï^Ïeô!èX¹\\ŸŸCöØØØ\0]‹ÛéôôôÜÜœWåõ\r!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 0!\0\0²\0 °ÿİËÍ³Ğè\0\0\0\0IEND®B`‚',0),('150005',1,'StudentLeaveProcess01.bpmn','150003','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"studentLeaveProcess\" name=\"Student Levae process\" isExecutable=\"true\">\n    <startEvent id=\"startevent1\" name=\"Start\" activiti:initiator=\"startUserId\"></startEvent>\n    <userTask id=\"usertask1\" name=\"æäº¤è¯·å‡å•\" activiti:assignee=\"${startUserId}\"></userTask>\n    <userTask id=\"usertask2\" name=\"ç­é•¿å®¡æ‰¹\" activiti:candidateGroups=\"bz\" activiti:formKey=\"audit_bz.jsp\"></userTask>\n    <userTask id=\"usertask3\" name=\"ç­ä¸»ä»»å®¡æ‰¹\" activiti:candidateGroups=\"bzr\" activiti:formKey=\"audit_ld.jsp\"></userTask>\n    <userTask id=\"usertask4\" name=\"ç³»è¾…å¯¼å‘˜å®¡æ‰¹\" activiti:candidateGroups=\"xfdy\" activiti:formKey=\"audit_ld.jsp\"></userTask>\n    <userTask id=\"usertask5\" name=\"å­¦ç”Ÿå¤„å®¡æ‰¹\" activiti:candidateGroups=\"xsc\" activiti:formKey=\"audit_ld.jsp\"></userTask>\n    <endEvent id=\"endevent1\" name=\"End\">\n      <extensionElements>\n        <activiti:executionListener event=\"end\" class=\"com.xing.leaveSystem.listener.ProcessCompleteListener\"></activiti:executionListener>\n      </extensionElements>\n    </endEvent>\n    <exclusiveGateway id=\"exclusivegateway1\" name=\"Exclusive Gateway\" default=\"flow6\"></exclusiveGateway>\n    <sequenceFlow id=\"flow1\" sourceRef=\"startevent1\" targetRef=\"usertask1\"></sequenceFlow>\n    <sequenceFlow id=\"flow2\" sourceRef=\"usertask1\" targetRef=\"usertask2\"></sequenceFlow>\n    <sequenceFlow id=\"flow3\" name=\"é€šè¿‡\" sourceRef=\"usertask2\" targetRef=\"exclusivegateway1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${msg==\'é€šè¿‡\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow4\" name=\"å¤§äº3å¤©\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask3\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${days<3}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow5\" name=\"3å¤©åˆ°7å¤©\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask4\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${days>=3 && days<=7}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow6\" name=\"å¤§äº7å¤©\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask5\"></sequenceFlow>\n    <sequenceFlow id=\"flow7\" sourceRef=\"usertask3\" targetRef=\"endevent1\"></sequenceFlow>\n    <sequenceFlow id=\"flow8\" sourceRef=\"usertask4\" targetRef=\"endevent1\"></sequenceFlow>\n    <sequenceFlow id=\"flow9\" sourceRef=\"usertask5\" targetRef=\"endevent1\"></sequenceFlow>\n    <sequenceFlow id=\"flow10\" name=\"æœªé€šè¿‡\" sourceRef=\"usertask2\" targetRef=\"endevent1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${msg==\'æœªé€šè¿‡\'}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_studentLeaveProcess\">\n    <bpmndi:BPMNPlane bpmnElement=\"studentLeaveProcess\" id=\"BPMNPlane_studentLeaveProcess\">\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"60.0\" y=\"120.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask1\" id=\"BPMNShape_usertask1\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"140.0\" y=\"110.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask2\" id=\"BPMNShape_usertask2\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"300.0\" y=\"110.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask3\" id=\"BPMNShape_usertask3\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"630.0\" y=\"40.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask4\" id=\"BPMNShape_usertask4\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"630.0\" y=\"110.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask5\" id=\"BPMNShape_usertask5\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"630.0\" y=\"180.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"810.0\" y=\"120.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway1\" id=\"BPMNShape_exclusivegateway1\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"480.0\" y=\"117.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\n        <omgdi:waypoint x=\"95.0\" y=\"137.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"140.0\" y=\"137.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"245.0\" y=\"137.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"300.0\" y=\"137.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"405.0\" y=\"137.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"480.0\" y=\"137.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"420.0\" y=\"120.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"500.0\" y=\"117.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"500.0\" y=\"67.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"630.0\" y=\"67.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"42.0\" x=\"531.0\" y=\"51.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\">\n        <omgdi:waypoint x=\"520.0\" y=\"137.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"630.0\" y=\"137.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"48.0\" x=\"530.0\" y=\"120.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\n        <omgdi:waypoint x=\"500.0\" y=\"157.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"500.0\" y=\"207.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"630.0\" y=\"207.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"42.0\" x=\"531.0\" y=\"187.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow7\" id=\"BPMNEdge_flow7\">\n        <omgdi:waypoint x=\"682.0\" y=\"95.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"827.0\" y=\"120.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow8\" id=\"BPMNEdge_flow8\">\n        <omgdi:waypoint x=\"735.0\" y=\"137.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"810.0\" y=\"137.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow9\" id=\"BPMNEdge_flow9\">\n        <omgdi:waypoint x=\"682.0\" y=\"180.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"827.0\" y=\"155.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow10\" id=\"BPMNEdge_flow10\">\n        <omgdi:waypoint x=\"352.0\" y=\"165.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"352.0\" y=\"280.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"600.0\" y=\"280.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"827.0\" y=\"280.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"827.0\" y=\"155.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"36.0\" x=\"360.0\" y=\"200.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0);

/*Table structure for table `act_ge_property` */

DROP TABLE IF EXISTS `act_ge_property`;

CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) collate utf8_bin NOT NULL default '',
  `VALUE_` varchar(300) collate utf8_bin default NULL,
  `REV_` int(11) default NULL,
  PRIMARY KEY  (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_property` */

insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('next.dbid','152501',62),('schema.history','create(5.20.0.1)',1),('schema.version','5.20.0.1',1);

/*Table structure for table `act_hi_actinst` */

DROP TABLE IF EXISTS `act_hi_actinst`;

CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) collate utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `CALL_PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `ACT_NAME_` varchar(255) collate utf8_bin default NULL,
  `ACT_TYPE_` varchar(255) collate utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) collate utf8_bin default NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime default NULL,
  `DURATION_` bigint(20) default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_actinst` */

insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('150010','studentLeaveProcess:1:150006','150007','150007','startevent1',NULL,NULL,'Start','startEvent',NULL,'2017-01-05 10:48:08','2017-01-05 10:48:08',13,''),('150012','studentLeaveProcess:1:150006','150007','150007','usertask1','150013',NULL,'æäº¤è¯·å‡å•','userTask','297ecaa059435c720159435c72170000','2017-01-05 10:48:08','2017-01-05 10:48:14',6103,''),('150014','studentLeaveProcess:1:150006','150007','150007','usertask2','150015',NULL,'ç­é•¿å®¡æ‰¹','userTask','297ecaa059435c720159435ca8a00001 ','2017-01-05 10:48:14','2017-01-05 10:50:15',121574,''),('150019','studentLeaveProcess:1:150006','150007','150007','exclusivegateway1',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2017-01-05 10:50:15','2017-01-05 10:50:15',1,''),('150020','studentLeaveProcess:1:150006','150007','150007','usertask4','150021',NULL,'ç³»è¾…å¯¼å‘˜å®¡æ‰¹','userTask','297ecaa0596c71ec01596c71eca30000 ','2017-01-05 10:50:15','2017-01-05 10:52:42',147215,''),('150024','studentLeaveProcess:1:150006','150007','150007','endevent1',NULL,NULL,'End','endEvent',NULL,'2017-01-05 10:52:42','2017-01-05 10:52:42',6,'');

/*Table structure for table `act_hi_attachment` */

DROP TABLE IF EXISTS `act_hi_attachment`;

CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `USER_ID_` varchar(255) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `DESCRIPTION_` varchar(4000) collate utf8_bin default NULL,
  `TYPE_` varchar(255) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `URL_` varchar(4000) collate utf8_bin default NULL,
  `CONTENT_ID_` varchar(64) collate utf8_bin default NULL,
  `TIME_` datetime default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_attachment` */

/*Table structure for table `act_hi_comment` */

DROP TABLE IF EXISTS `act_hi_comment`;

CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `TYPE_` varchar(255) collate utf8_bin default NULL,
  `TIME_` datetime NOT NULL,
  `USER_ID_` varchar(255) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `ACTION_` varchar(255) collate utf8_bin default NULL,
  `MESSAGE_` varchar(4000) collate utf8_bin default NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_comment` */

/*Table structure for table `act_hi_detail` */

DROP TABLE IF EXISTS `act_hi_detail`;

CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `TYPE_` varchar(255) collate utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `ACT_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) collate utf8_bin default NULL,
  `REV_` int(11) default NULL,
  `TIME_` datetime NOT NULL,
  `BYTEARRAY_ID_` varchar(64) collate utf8_bin default NULL,
  `DOUBLE_` double default NULL,
  `LONG_` bigint(20) default NULL,
  `TEXT_` varchar(4000) collate utf8_bin default NULL,
  `TEXT2_` varchar(4000) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_detail` */

/*Table structure for table `act_hi_identitylink` */

DROP TABLE IF EXISTS `act_hi_identitylink`;

CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `GROUP_ID_` varchar(255) collate utf8_bin default NULL,
  `TYPE_` varchar(255) collate utf8_bin default NULL,
  `USER_ID_` varchar(255) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_identitylink` */

insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('150009',NULL,'starter','297ecaa059435c720159435c72170000',NULL,'150007'),('150016','bz','candidate',NULL,'150015',NULL),('150017',NULL,'participant','297ecaa059435c720159435ca8a00001 ',NULL,'150007'),('150022','xfdy','candidate',NULL,'150021',NULL),('150023',NULL,'participant','297ecaa0596c71ec01596c71eca30000 ',NULL,'150007');

/*Table structure for table `act_hi_procinst` */

DROP TABLE IF EXISTS `act_hi_procinst`;

CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) collate utf8_bin default NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin NOT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime default NULL,
  `DURATION_` bigint(20) default NULL,
  `START_USER_ID_` varchar(255) collate utf8_bin default NULL,
  `START_ACT_ID_` varchar(255) collate utf8_bin default NULL,
  `END_ACT_ID_` varchar(255) collate utf8_bin default NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) collate utf8_bin default NULL,
  `DELETE_REASON_` varchar(4000) collate utf8_bin default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  `NAME_` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_procinst` */

insert  into `act_hi_procinst`(`ID_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`) values ('150007','150007','297ecaa0596c86c501596c86c5f30000','studentLeaveProcess:1:150006','2017-01-05 10:48:08','2017-01-05 10:52:42',274222,'297ecaa059435c720159435c72170000','startevent1','endevent1',NULL,NULL,'',NULL);

/*Table structure for table `act_hi_taskinst` */

DROP TABLE IF EXISTS `act_hi_taskinst`;

CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  `TASK_DEF_KEY_` varchar(255) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `PARENT_TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `DESCRIPTION_` varchar(4000) collate utf8_bin default NULL,
  `OWNER_` varchar(255) collate utf8_bin default NULL,
  `ASSIGNEE_` varchar(255) collate utf8_bin default NULL,
  `START_TIME_` datetime NOT NULL,
  `CLAIM_TIME_` datetime default NULL,
  `END_TIME_` datetime default NULL,
  `DURATION_` bigint(20) default NULL,
  `DELETE_REASON_` varchar(4000) collate utf8_bin default NULL,
  `PRIORITY_` int(11) default NULL,
  `DUE_DATE_` datetime default NULL,
  `FORM_KEY_` varchar(255) collate utf8_bin default NULL,
  `CATEGORY_` varchar(255) collate utf8_bin default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_taskinst` */

insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`) values ('150013','studentLeaveProcess:1:150006','usertask1','150007','150007','æäº¤è¯·å‡å•',NULL,NULL,NULL,'297ecaa059435c720159435c72170000','2017-01-05 10:48:08',NULL,'2017-01-05 10:48:14',6093,'completed',50,NULL,NULL,NULL,''),('150015','studentLeaveProcess:1:150006','usertask2','150007','150007','ç­é•¿å®¡æ‰¹',NULL,NULL,NULL,'297ecaa059435c720159435ca8a00001 ','2017-01-05 10:48:14','2017-01-05 10:49:45','2017-01-05 10:50:15',121558,'completed',50,NULL,'audit_bz.jsp',NULL,''),('150021','studentLeaveProcess:1:150006','usertask4','150007','150007','ç³»è¾…å¯¼å‘˜å®¡æ‰¹',NULL,NULL,NULL,'297ecaa0596c71ec01596c71eca30000 ','2017-01-05 10:50:15','2017-01-05 10:52:33','2017-01-05 10:52:42',147209,'completed',50,NULL,'audit_ld.jsp',NULL,'');

/*Table structure for table `act_hi_varinst` */

DROP TABLE IF EXISTS `act_hi_varinst`;

CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) collate utf8_bin default NULL,
  `REV_` int(11) default NULL,
  `BYTEARRAY_ID_` varchar(64) collate utf8_bin default NULL,
  `DOUBLE_` double default NULL,
  `LONG_` bigint(20) default NULL,
  `TEXT_` varchar(4000) collate utf8_bin default NULL,
  `TEXT2_` varchar(4000) collate utf8_bin default NULL,
  `CREATE_TIME_` datetime default NULL,
  `LAST_UPDATED_TIME_` datetime default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_varinst` */

insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('150008','150007','150007',NULL,'startUserId','string',1,NULL,NULL,NULL,'297ecaa059435c720159435c72170000',NULL,'2017-01-05 10:48:08','2017-01-05 10:52:42'),('150011','150007','150007',NULL,'days','integer',1,NULL,NULL,3,'3',NULL,'2017-01-05 10:48:08','2017-01-05 10:52:42'),('150018','150007','150007',NULL,'msg','string',1,NULL,NULL,NULL,'é€šè¿‡',NULL,'2017-01-05 10:50:15','2017-01-05 10:52:42');

/*Table structure for table `act_id_group` */

DROP TABLE IF EXISTS `act_id_group`;

CREATE TABLE `act_id_group` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `TYPE_` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_group` */

insert  into `act_id_group`(`ID_`,`REV_`,`NAME_`,`TYPE_`) values ('bz',1,'ç­é•¿',NULL),('bzr',1,'ç­ä¸»ä»»',NULL),('gly',1,'ç®¡ç†å‘˜',NULL),('xfdy',1,'ç³»è¾…å¯¼å‘˜',NULL),('xs',1,'å­¦ç”Ÿ',NULL),('xsc',1,'å­¦ç”Ÿå¤„',NULL);

/*Table structure for table `act_id_info` */

DROP TABLE IF EXISTS `act_id_info`;

CREATE TABLE `act_id_info` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `USER_ID_` varchar(64) collate utf8_bin default NULL,
  `TYPE_` varchar(64) collate utf8_bin default NULL,
  `KEY_` varchar(255) collate utf8_bin default NULL,
  `VALUE_` varchar(255) collate utf8_bin default NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_info` */

/*Table structure for table `act_id_membership` */

DROP TABLE IF EXISTS `act_id_membership`;

CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `GROUP_ID_` varchar(64) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_membership` */

insert  into `act_id_membership`(`USER_ID_`,`GROUP_ID_`) values ('297ecaa059435c720159435ca8a00001','bz'),('297ecaa0596222830159622283c00000','bzr'),('297ecaa0596c7b3301596c7b338b0000','gly'),('297ecaa0596c71ec01596c71eca30000','xfdy'),('297ecaa059435c720159435c72170000','xs'),('297ecaa0596c71ec01596c72299b0001','xsc');

/*Table structure for table `act_id_user` */

DROP TABLE IF EXISTS `act_id_user`;

CREATE TABLE `act_id_user` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `FIRST_` varchar(255) collate utf8_bin default NULL,
  `LAST_` varchar(255) collate utf8_bin default NULL,
  `EMAIL_` varchar(255) collate utf8_bin default NULL,
  `PWD_` varchar(255) collate utf8_bin default NULL,
  `PICTURE_ID_` varchar(64) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_user` */

insert  into `act_id_user`(`ID_`,`REV_`,`FIRST_`,`LAST_`,`EMAIL_`,`PWD_`,`PICTURE_ID_`) values ('297ecaa059435c720159435c72170000',1,'zhangsan',NULL,'111111@qq.com','111111',NULL),('297ecaa059435c720159435ca8a00001',1,'lishi',NULL,'2111111@qq.com','111111',NULL),('297ecaa0596222830159622283c00000',1,'wangwu',NULL,'111111@qq.com','111111',NULL),('297ecaa0596c71ec01596c71eca30000',1,'zhaoliu',NULL,'111111@qq.com','111111',NULL),('297ecaa0596c71ec01596c72299b0001',1,'sunqi',NULL,'111111@qq.com','111111',NULL),('297ecaa0596c7b3301596c7b338b0000',1,'admin',NULL,'admin@qq.com','admin',NULL);

/*Table structure for table `act_procdef_info` */

DROP TABLE IF EXISTS `act_procdef_info`;

CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `INFO_JSON_ID_` varchar(64) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_procdef_info` */

/*Table structure for table `act_re_deployment` */

DROP TABLE IF EXISTS `act_re_deployment`;

CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `CATEGORY_` varchar(255) collate utf8_bin default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  `DEPLOY_TIME_` timestamp NULL default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_deployment` */

insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`TENANT_ID_`,`DEPLOY_TIME_`) values ('150003','StudentLeaveProcess01.bpmn',NULL,'','2017-01-05 10:47:01');

/*Table structure for table `act_re_model` */

DROP TABLE IF EXISTS `act_re_model`;

CREATE TABLE `act_re_model` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `KEY_` varchar(255) collate utf8_bin default NULL,
  `CATEGORY_` varchar(255) collate utf8_bin default NULL,
  `CREATE_TIME_` timestamp NULL default NULL,
  `LAST_UPDATE_TIME_` timestamp NULL default NULL,
  `VERSION_` int(11) default NULL,
  `META_INFO_` varchar(4000) collate utf8_bin default NULL,
  `DEPLOYMENT_ID_` varchar(64) collate utf8_bin default NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) collate utf8_bin default NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) collate utf8_bin default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_model` */

/*Table structure for table `act_re_procdef` */

DROP TABLE IF EXISTS `act_re_procdef`;

CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `CATEGORY_` varchar(255) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `KEY_` varchar(255) collate utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) collate utf8_bin default NULL,
  `RESOURCE_NAME_` varchar(4000) collate utf8_bin default NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) collate utf8_bin default NULL,
  `DESCRIPTION_` varchar(4000) collate utf8_bin default NULL,
  `HAS_START_FORM_KEY_` tinyint(4) default NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) default NULL,
  `SUSPENSION_STATE_` int(11) default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_procdef` */

insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`) values ('studentLeaveProcess:1:150006',1,'http://www.activiti.org/test','Student Levae process','studentLeaveProcess',1,'150003','StudentLeaveProcess01.bpmn','StudentLeaveProcess01.png',NULL,0,1,1,'');

/*Table structure for table `act_ru_event_subscr` */

DROP TABLE IF EXISTS `act_ru_event_subscr`;

CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `EVENT_TYPE_` varchar(255) collate utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) collate utf8_bin default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `ACTIVITY_ID_` varchar(64) collate utf8_bin default NULL,
  `CONFIGURATION_` varchar(255) collate utf8_bin default NULL,
  `CREATED_` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_event_subscr` */

/*Table structure for table `act_ru_execution` */

DROP TABLE IF EXISTS `act_ru_execution`;

CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `BUSINESS_KEY_` varchar(255) collate utf8_bin default NULL,
  `PARENT_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  `SUPER_EXEC_` varchar(64) collate utf8_bin default NULL,
  `ACT_ID_` varchar(255) collate utf8_bin default NULL,
  `IS_ACTIVE_` tinyint(4) default NULL,
  `IS_CONCURRENT_` tinyint(4) default NULL,
  `IS_SCOPE_` tinyint(4) default NULL,
  `IS_EVENT_SCOPE_` tinyint(4) default NULL,
  `SUSPENSION_STATE_` int(11) default NULL,
  `CACHED_ENT_STATE_` int(11) default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `LOCK_TIME_` timestamp NULL default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_execution` */

/*Table structure for table `act_ru_identitylink` */

DROP TABLE IF EXISTS `act_ru_identitylink`;

CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `GROUP_ID_` varchar(255) collate utf8_bin default NULL,
  `TYPE_` varchar(255) collate utf8_bin default NULL,
  `USER_ID_` varchar(255) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_identitylink` */

/*Table structure for table `act_ru_job` */

DROP TABLE IF EXISTS `act_ru_job`;

CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `TYPE_` varchar(255) collate utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp NULL default NULL,
  `LOCK_OWNER_` varchar(255) collate utf8_bin default NULL,
  `EXCLUSIVE_` tinyint(1) default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  `RETRIES_` int(11) default NULL,
  `EXCEPTION_STACK_ID_` varchar(64) collate utf8_bin default NULL,
  `EXCEPTION_MSG_` varchar(4000) collate utf8_bin default NULL,
  `DUEDATE_` timestamp NULL default NULL,
  `REPEAT_` varchar(255) collate utf8_bin default NULL,
  `HANDLER_TYPE_` varchar(255) collate utf8_bin default NULL,
  `HANDLER_CFG_` varchar(4000) collate utf8_bin default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_job` */

/*Table structure for table `act_ru_task` */

DROP TABLE IF EXISTS `act_ru_task`;

CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `PARENT_TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `DESCRIPTION_` varchar(4000) collate utf8_bin default NULL,
  `TASK_DEF_KEY_` varchar(255) collate utf8_bin default NULL,
  `OWNER_` varchar(255) collate utf8_bin default NULL,
  `ASSIGNEE_` varchar(255) collate utf8_bin default NULL,
  `DELEGATION_` varchar(64) collate utf8_bin default NULL,
  `PRIORITY_` int(11) default NULL,
  `CREATE_TIME_` timestamp NULL default NULL,
  `DUE_DATE_` datetime default NULL,
  `CATEGORY_` varchar(255) collate utf8_bin default NULL,
  `SUSPENSION_STATE_` int(11) default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  `FORM_KEY_` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_task` */

/*Table structure for table `act_ru_variable` */

DROP TABLE IF EXISTS `act_ru_variable`;

CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `TYPE_` varchar(255) collate utf8_bin NOT NULL,
  `NAME_` varchar(255) collate utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `BYTEARRAY_ID_` varchar(64) collate utf8_bin default NULL,
  `DOUBLE_` double default NULL,
  `LONG_` bigint(20) default NULL,
  `TEXT_` varchar(4000) collate utf8_bin default NULL,
  `TEXT2_` varchar(4000) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_variable` */

/*Table structure for table `leave_system_audit` */

DROP TABLE IF EXISTS `leave_system_audit`;

CREATE TABLE `leave_system_audit` (
  `audit_id` varchar(64) collate utf8_bin NOT NULL,
  `leave_id` varchar(64) collate utf8_bin default NULL,
  `user_id` varchar(64) collate utf8_bin default NULL,
  `audit_info` varchar(100) collate utf8_bin default NULL,
  `audit_type` varchar(64) collate utf8_bin default NULL,
  `createtime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `status` varchar(64) collate utf8_bin default NULL,
  `task_id` varchar(64) collate utf8_bin default NULL,
  PRIMARY KEY  (`audit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `leave_system_audit` */

insert  into `leave_system_audit`(`audit_id`,`leave_id`,`user_id`,`audit_info`,`audit_type`,`createtime`,`status`,`task_id`) values ('297ecaa0596c86c501596c88b3f60001','297ecaa0596c86c501596c86c5f30000','297ecaa059435c720159435ca8a00001','ss ',NULL,'2017-01-05 10:50:15','1','150015'),('297ecaa0596c86c501596c8af0d90002','297ecaa0596c86c501596c86c5f30000','297ecaa0596c71ec01596c71eca30000','tongguo',NULL,'2017-01-05 10:52:42','1','150021');

/*Table structure for table `leave_system_group` */

DROP TABLE IF EXISTS `leave_system_group`;

CREATE TABLE `leave_system_group` (
  `group_id` varchar(64) collate utf8_bin NOT NULL,
  `name` varchar(64) collate utf8_bin default NULL,
  PRIMARY KEY  (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `leave_system_group` */

insert  into `leave_system_group`(`group_id`,`name`) values ('bz','ç­é•¿'),('bzr','ç­ä¸»ä»»'),('gly','ç®¡ç†å‘˜'),('xfdy','ç³»è¾…å¯¼å‘˜'),('xs','å­¦ç”Ÿ'),('xsc','å­¦ç”Ÿå¤„');

/*Table structure for table `leave_system_his_leave` */

DROP TABLE IF EXISTS `leave_system_his_leave`;

CREATE TABLE `leave_system_his_leave` (
  `leave_id` varchar(64) collate utf8_bin NOT NULL,
  `user_id` varchar(64) collate utf8_bin default NULL,
  `leavename` varchar(64) collate utf8_bin default NULL,
  `leavedays` int(11) default NULL COMMENT 'å¤©æ•°',
  `status` varchar(64) collate utf8_bin default NULL,
  `createtime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `endtime` timestamp NOT NULL default '0000-00-00 00:00:00',
  `processInstance_id` varchar(64) collate utf8_bin default NULL,
  `leaveReason` text collate utf8_bin,
  PRIMARY KEY  (`leave_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `leave_system_his_leave` */

/*Table structure for table `leave_system_leave` */

DROP TABLE IF EXISTS `leave_system_leave`;

CREATE TABLE `leave_system_leave` (
  `leave_id` varchar(64) collate utf8_bin NOT NULL,
  `user_id` varchar(64) collate utf8_bin default NULL,
  `leavename` varchar(64) collate utf8_bin default NULL,
  `leavedays` int(11) default NULL COMMENT 'å¤©æ•°',
  `status` varchar(64) collate utf8_bin default NULL,
  `createtime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `endtime` timestamp NOT NULL default '0000-00-00 00:00:00',
  `processInstance_id` varchar(64) collate utf8_bin default NULL,
  `leaveReason` text collate utf8_bin,
  PRIMARY KEY  (`leave_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `leave_system_leave` */

insert  into `leave_system_leave`(`leave_id`,`user_id`,`leavename`,`leavedays`,`status`,`createtime`,`endtime`,`processInstance_id`,`leaveReason`) values ('297ecaa0596c86c501596c86c5f30000','297ecaa059435c720159435c72170000',NULL,3,'å®¡æ ¸é€šè¿‡','2017-01-05 10:52:42','2017-01-05 10:48:09','150007','æ˜¯æ˜¯æ˜¯');

/*Table structure for table `leave_system_loginuser` */

DROP TABLE IF EXISTS `leave_system_loginuser`;

CREATE TABLE `leave_system_loginuser` (
  `user_id` varchar(64) collate utf8_bin NOT NULL,
  `username` varchar(64) collate utf8_bin default NULL,
  `password` varchar(64) collate utf8_bin default NULL,
  `groups` varchar(100) collate utf8_bin default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `leave_system_loginuser` */

insert  into `leave_system_loginuser`(`user_id`,`username`,`password`,`groups`) values ('297ecaa059435c720159435c72170000','zhangsan','111111','xs'),('297ecaa059435c720159435ca8a00001','lishi','111111','bz'),('297ecaa0596222830159622283c00000','wangwu','111111','bzr'),('297ecaa0596c71ec01596c71eca30000','zhaoliu','111111','xfdy'),('297ecaa0596c71ec01596c72299b0001','sunqi','111111','xsc'),('297ecaa0596c7b3301596c7b338b0000','admin','admin','gly');

/*Table structure for table `leave_system_membership` */

DROP TABLE IF EXISTS `leave_system_membership`;

CREATE TABLE `leave_system_membership` (
  `group_id` varchar(64) collate utf8_bin default NULL,
  `user_id` varchar(64) collate utf8_bin default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `leave_system_membership` */

insert  into `leave_system_membership`(`group_id`,`user_id`) values ('xs','297ecaa059435c720159435c72170000'),('bz','297ecaa059435c720159435ca8a00001'),('bzr','297ecaa0596222830159622283c00000'),('xfdy','297ecaa0596c71ec01596c71eca30000'),('xsc','297ecaa0596c71ec01596c72299b0001'),('gly','297ecaa0596c7b3301596c7b338b0000');

/*Table structure for table `leave_system_user` */

DROP TABLE IF EXISTS `leave_system_user`;

CREATE TABLE `leave_system_user` (
  `user_id` varchar(64) collate utf8_bin NOT NULL,
  `username` varchar(64) collate utf8_bin default NULL,
  `password` varchar(64) collate utf8_bin default NULL,
  `email` varchar(64) collate utf8_bin default NULL,
  `groups` varchar(400) collate utf8_bin default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `leave_system_user` */

insert  into `leave_system_user`(`user_id`,`username`,`password`,`email`,`groups`) values ('297ecaa059435c720159435c72170000','zhangsan','111111','111111@qq.com','xs'),('297ecaa059435c720159435ca8a00001','lishi','111111','2111111@qq.com','bz'),('297ecaa0596222830159622283c00000','wangwu','111111','111111@qq.com','bzr'),('297ecaa0596c71ec01596c71eca30000','zhaoliu','111111','111111@qq.com','xfdy'),('297ecaa0596c71ec01596c72299b0001','sunqi','111111','111111@qq.com','xsc'),('297ecaa0596c7b3301596c7b338b0000','admin','admin','admin@qq.com','gly');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
