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

insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('150004',1,'StudentLeaveProcess01.png','150003','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0?\0\0\0-;�:\0\08�IDATx���ql$g}?~J�D�������#V)�� �54�Rs�J��\"p�#����S���\n�*����K�R�U�u�Y\"�KuK�I�\\�rG.	&����m�����v��fwg��}�3��z鑵ޝ����<��^�E\0\0@PCYo\0\0\0�!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0z�\\.���NNN����J��A�{|&&&fffVVV�.l	!\0za~~>�q¾�替~�mǎ?��:�#���<x�k���I��.�\'d��ZYY���ڽ{��GO�[=gԏ\'�z2����Y^^κP��\r\0[(Nأ�����s�V�\ZI�/߲s�Υ������\0�����*	�y#}|��[���7�.#d�V���߽��յ����ȟ���?�u� !\0�D�\\.�J�>���v�hg�:��;޺���u� \0!\0����������s����w��&w��\Z�q��===�u� \0!\0������/��K	���?��G�G�F�=�w6���ځ/~�k�=s׹���]����[�����������n&�ۇ���f]:@��-122������������SQtz=zf-z�\\�\\��_|l�W�z���������R9:�}�[�U��>=�������Y��`Kl۶�������87?w>:{��Mk��~�+�����k���_��gעgV��W��(����+!��`�x߳-�<�+I�(��=�¬T��{z-:y&:w��VVV>���~��>}���ò�����;�}_�}j�BsЕv\"Q�����y%(�_m\\��\'��~|*Z��sgώ\\~���+������������6�w�Fk\r͜�\0t������^��}u�kγJP~�6�/9y&z����{���^��W��ŗ\\�����,d����\r��Q��C����l>d���p�ҥNלg���R�g֣����~��趻߲����k/������/<E��Fϝ�p����p߁\ZE�;T9��̆����.���ې����ڨ�N���Y�~r.z���;X���o{�o��g���\'��ɳQ�o�����(zݡ�y@W�Ru�A��\rW�^.����g\rAy��W�����y`�Б�;/�q��;�?�_w}�[<�?��~��������;��C?��?�����;�+dC7��\0l^5m��6\\��S�E[���t���޿�/�?x׻\Z�8P��u�*�1\0�*d���+o8��5�Y%d�4:�.:�8�ؤ�0��Z�Z��u�3�}��?et:\n]t�q�I݆캷�k�4v;kγJ�~��t��P�y�f4\'��l�Ql�h�yV	�O����\Z8��L�}4����t���������\ZZr�����.--������N��Mp�&=z�����^z����[�l!�A�<�M*��]tQ5g��U�z��\\��v%d�(��p��/�ᒵ�/���J\n�8�`�o�^�92�\\rɵ�^���ϟ��Q[m���+[�?�AnmXy��54_5�l���`���oaaa߾}c/*�J,6���Ǻ�+�]�ܚ��޼y��l~���rֳp�8[OLL��:�/J��=�q�e��2�DE|x���~��Q]I����o�S~㪒�m���W�Vۼ1A������\n8�����r�I빹��������TC������������l��J�<�娮��k����[^�pS�a��^\r���ښ3�)��<�s���q�[XX�zC��#�<2<<<>>^*������]k%w����� ���\nS��򦆻\'-Y͆��/t��\r��UA! �1@?���kᙙ��/�	=��q�k}�n\'d7���Ս��������/d3Ȝ�\0}+N~���vV*��.ǋ����\r�I�/[,�ۆkZ^ngc��r֥�\0��\0}k׮]��z+ׅ�����_I�rʚۿ�yɴ���\rAv�a3�.�<�OsssYo�@��χ�/f܇�ז���oj^2�!Z^�mU�5Av9��A\0�c��4>>>??��V�J��A7�������S���M雗tk��T/���.�:��A\0�c�>����}����b�UB�� ����Wq4^���$���_I����WȦ?8���׊�A%t3:B6��yЇ���{�����b�UB�CF�CȦ?8����ؘO�ɜ�-d3Ȝ�\0}ț��A�׏\Z�!���<�C�R��g�K���}��!d���\0}h۶m>�1s���ht:�l�����)yP	��3:�^�����)y0<<|�̽���5:\Z�^�����)yP*�~�k��\Z\rg/��yЇĔ<������w�����422�u� \0]�	�y�����k3���\Z�2󉩩��K��\0}H�΃�����7�)߳=`�9&&~knn.��A\0�0@�sb�{֣��vƿ�����x�E�0ta�>$d�D�\\{ۡC�E��cy����7��ܞu� ]�	�����8:z���\\1�F����F>�u� ]�	ٹr�С8g���\'Qt��<��>92RZX��!��\0}H�Λr�<==56v���_-/�\ZE������������c����555u�����eU/�.Ї��|ZXX������~���m�.���:���jiii�޽�RIԦ�ta�>4$dS|��ˢ6ť�!!��!jSP�0@��3�6���!!��T��۷o߷o���J֛ita�>$d���x��R�$j�g�0@��{�69��!!�!j�[�0@�(�Q{yy9�́ta�>$d3�jQ{�޽�6�Ӆ�����*���ɜ.Ї�l��M�ta�>$dC$j�)]�	�PS��{��YZZ�zs�0@��A�o���8jOMM���.Ї�lH233#j��p!ſ����NNN���ŝbhP�������c��g�oU�ַ7���\\2���0�Em��.\\<���q_�{��7����n;v��������G�����\\sM|L⎙uqP���o�	��cv�pv��l]�H�_��F�{����8�zΨO>�dܬ�S��W���o�	ٹbv�|vW�v��ϑ#G����.\\q���M�;�z�H\Z�|���;w�		��������fwQf���l\\���	Q� t�����������n���̺\\S���o�	��avkv��͉��������W����v�G����_�������fB��	����[Ԧ{�p���R���cK�kg�vƩ�?ٱ㭋��Y��-����͊��fw�g��M7t�������Z]{�6�>��6�&��^5��������.][Է��!;�����ը=66������P$�pĿC���ԣ����(z�|��j�ݳ�}g�{N���7���3w�����U�n.����n�=�ϼcf2�}�P��.][Է�뛉�{Yxs�̙��4��=V!j�&!�\0FFF|��յ��144t*�N�GϬEO�����?���\r]��]WO<�\Z�8�x>Z*G�֢/|���!�p�:}rxx8�ҵE}����g뫮���7��9;[fw��nQ���m�.��sss��훘�{���x|���l�~�l۶���������>w>:{��Mk��~�+�����k���_��gעgV��W�xo���J�>5��(.W���o�U�=�>|nu-�*gg�����ݛ���dfff|h@���<ބ���O�������Oă���۾Q�|�+���&\'\'�Ʒk׮�|�\\��>[�ע�g�s�_X �!��O�����_�r��ѹJ�����5�w�F��t�������4����bIwϭ��]���?��`v�lvg�����î9N2q��������7�xc���>:��<nӑ#G�s=>/�0]��4n���k������_|*���j�B�>=�\\��S�j�;{v��ˇ�^944��?��������5�Ҧշ����W}�NY,���hN�=��)Q e���oz͹ev�rvg%N���q���q���ڵk�x]�T*yh�+�y�n����)��۾�a�n���XڳgO����gjc��Ǔg�ǟ��x>�����u�{�O]|�e��|������>�p߁\ZEi��a};\njy>������^�������������c7\\Y����X�k�!�;���cG����H��;v���+S�a�C���\Zt�|����&��~�c�w�nX2~�B��j��<n�������������L�(�/o��ڕڈ�=�=]��\\ȓ�G�ݽ��W��^{ٶ���~��(:u6z��;�~����(J�V��׷�A�^,s�	{Krv�_�/]��t������x�q��5����ٝ���O�jy�[��r\Z�	��	�}�O�?�2��|�d�^�o�^�K�T�~޹R��&N��y9;;��]{�H������w��x欭��6��\'��ϬF?9=���,�������牳я������(nԷ�uw�}j�M�o��[K�\r��BJ��\\��T;	{+_7�A�N���e�n�޼V!��ݳٝ+�Q�S��T���k_��~�a�8{���6)�����uC���G?V�����C�z�ǴV��8699�}®��sv_7��j��~���{�Y����������u�w�����s��7��{�辣<�����M�~ϻ3o��t:��e}ky.�)����2޵���\"gW_�Q��-i���EȎW��+E:Zsޘݽ��yS��333��˿\\;c_����?�\\}��v�\'��~���_��k��zn�2?h�}�߿��W�4���O��w�Q�M?]?>���o��\'��zW�j�M�o/�;��3���&-��N�=���)��c��h�_������9o��^��|�����H}q/���+�������d�8�t�D�m۪��x��LM����čA�������7f�s/Si�\'�NGQڴ����C>��5do.ao���\r��94׮oy؛�Oz�H�s�����Χ��ͧ��������ծ��s���/���d��9d�	{s?`�ǉG{�K�z�ȅ6}�)��Q�6�����P��d�_����p����q>���;v|������ܜ�7��-��KW6���ל7fw/gw>MOO���rdd$�$�����A2L���۷o�U�LE=����<aWǇ>�����Ҧ�4:Ei���������dGuO�n��A�L�՗c���]M�����ko���i���I˴�2��v֜7fw/gwQ,--MMM�J�={�T\'Q<O<�X�\0��ӵ�ٻwo��:�z�?:}K쎞̎�Ѭw�%�6����(J�V�^ַ�{���Ҕ�]Ր��v�ݬ��%����[�x�k������p��W��П�0���v۶mY��+�y�H�O�-J�ձs����	N�M���t�M�o��[��uKQ�ӥ-��Js®֪9g7\'졦��B�씃Sl�k��ݔfw�fw���9;�i�ڈ�@u���L��V��xfffjjjKC�\'��~zz��;5;;��.ݕ6�lt:rզշ��ۥ�ӣ&�S�ko)P���{o˄}˗�Ҽ��|�z�2���$)�F�d��2�}�3�u׽�&6=N24(�y�gϞo�qKC��o�F/���ѣ��p饗<x��Vm��mZ}���]J?=�6����}�������.��fw��s������T�e���|׮]��;U�<���Ǔ~T�\Zǎ�K=ۣr�|�EU�ī^��7������V����4��MYr���_���mz{V�t��oG�zs�}�r7_�ҝʮ�!��Q۟�ޜ��L�rv7�zv���Iͳa�$I�O������;�܈�L����3q����T�]��Y!��-z������Ϥ^�T�+/��k�����;���?�����~�I+O�>�w�/Ve�e�ܒn���L׃�6�{��n�\n�Ś�R�[7rU�.��}jzR��0a���;�[N��e���p�O��Mm9��7�;�ܨ�y��ڃf}Z!�~|��/��\'h�?3w��cݏ�zZ�|s������_7܆�;[}��T0]�]N*�P�a���ذ�)�M��;X��v#N���-��+_�ʆ5�����is\r�W�\r� S���ښS��MJ_ }����\r���路��r�֟udh�<�###�y����^��e�]V�{q�Y\\\\�^x.��nF����i��Y���ᒶ����_U/+�nK뛴��Uh�X�L_g�ݛh��.o��R��q�ȑ8g?���\r[V���j���-�?n��Y��يٝ�9��U;ׄ�*=�\0}3�S΍�g�oQ����g��`���o�dWG�_�]{+�xֽ�}����n�4�ݏ�z��q��\Z.�p�2��o~��Q���t��=�`��Էe뿶�Wҕ\rM�T˲n�澩o��O��������6����l��N�\rS;iᔇn9aSfw;˄�\0C}1��ύ�S�[�g��\\]����V!�㩩���S؊q�w�ܹ�g{��#�Ŀt����J�����DV����y��k��&�ܗ-��%]�~{V�t��oþ���4��lX�6/�_؊��g}��~zT���	��xE�5)9[�޴-��-�Q��n9�ڙ��7?D��?fw��\'��Q���|&x��΃VW>::���4d8p ��#5�8�_s��r����fffZ��f��R�z�\r��u�7Ӥ�[�򖏕����o/+���m���-r�O�v*U_�U����q���5I9;�g����t���n���v7�bv���t�v�\r/�����N97���_=nq��a>q��ՕONN�|�yI!���|�/�Ґ�{������w��n�H7��\'��ʔ��]٪�&޽�^)�;�Ҧ�n����5M�NRM�|���o@�9;)aW�K$�sj\Z>w]��:��ͭ��6���J�)���[�av/..V]<I�=u:l��Eu�q��zGZQ��-����t�O������n�������z᥮��p�JZ.߼���N�Ah�.][B�oJ����d�5��y�[�SE�oX�9��k���(\r��ל�w��]��.ao�.\'Bz�M��m�ؤ���mQ��]*��G���/�0�7ɎyG�l�<��W���\'?�<�]|I�[=�����z!e�)ԯ���ݽa���;�Ҧ�n���Rӆӣ�]6�\\[U��������OM��l	��6w�7O����<���LZsRH�K�:�������߭�;v|2������j\'&&���AW��\\.ǿnŻe�\'��XZ^^�z_RiR?�~��S��r�/6����_�|}���k��p�Mo������EoyMz�����[T��w+���韚�l	��6q�\'Mؖ-�y��t�������O���������\r5���������w�����qg�!L���<���}�{���OcG/���]�{����z��ܷv�������%[���l�ڬKז-���z5T|�?�|)g���]Q�E�sv���}��%�����O�ͷ6O�\r�x��ۙ��\0�4��7~c�������G�?�W��I�����?^K�{���z�)rȎ��;���L�ϡ�_m�޳��4�cF��(mZ}���[��ϩ�v/��f���R�G����w�J���}�ڵ�z}������8���\r:^U�� ?��}����ܹ3�@V�O?>ųޭF�6����(J�V�����4gK�=fv��q����j�[�m۶��񹹹�q\n���D���$�4N<�X-a/,,d�Ǽ������b������������[����w�m��۴��w}�ZG��.a���=ȳ;��(�JSSS������CvÒq&�=�G�N?���;J$?h&�K�~8���/p�I������z>vTi���G�NGQڴ��w}{���]��{����]��{�lcvv6ީ�����v�Z\\\\l����\\��mƩ&�����~�{�S�Z	;W�}׬���?c>�яu���gO���O~�����w\"Q�M��t�M�o׷76��u	;f�����x]��g~�gFFFR�a���s��`����8[��g>�{������U\"yS��Y|���嗏ġ������M7���C\Z��z��T�����(J�V���oϤ|��{pfwR�����������o߾���Vv�ܙt����t̡����,>����~���3t�?���|��{�{�/s�5�����&o�Ҧ�gt:�Ҧշ���K-?w]�ΐ�=�;N����O�ם�W255�2L7�\'��C��P�B����ſP�����h�m���\'����}�h���3�����h�M�o׷��s���9���gw���8^OOO\"9N2qV�����hC��qbb��o��u��<p�tz�ᯭ�?ht4�Ҧշ���{՜}��q	;sfw���Z�����9�8p��%��1�����߸}�h|o�K###Y��-�����D����v�����ݙ���]w���Q�?�	م�����k3o|�\Z�2��ү��]߬8>y`v����*^W��\ro�C�?��?.��`iiid�Mg���Gm���ߪ�H�<S���oV���A`v��쮾�BV�:v�\r7T_���׿�_�\nD.�}�Y��7��>�������g����̈́��fw�gw-^8p ��jď[{羋/���+��d3�]���������(��H�˷���ie���������fB��	�����>^�E�pK&&&��Z�\rox���L��C�t��X\\\\�|qq.��I#���ϳ���e]���o׷����0��5����������K��K�o�Ѕ��СCq�޿�O��^�y��}rd�����Yj�Է���cBv��݅�ݹ��U������-oyK-d����OP/]�`�i?==56v���_-/�\ZE������������c��K���������7fw�g����������������o��կ�s��m��I��ⵯ}��]�p!ųkj���o��6?v��m�v����q�κ,��o���oo	ٹdv������8�����G��72zqRǗ��HQ��@�|�[-��!U��u��pH����A����*��pH����A����\"��*��pH����A�#G�LLL���1^W�ԅ�`@\"=������ztt4o���)��pH����A���*��pH����1��,^W�ԅ�`@\"=��Ԏ������ʤ.��ťv�8^�U�_��2�G��Dzzq��������M��Q0 ��^\\j� �x]eR������R;��@��*��pH����ѯ���v��5P�ʤ.��ťv��8^���NLL:t(�mɀI]8\n$�ӋK��\'�x}�ȑ��%3&u�(�HO/.�˧r�<;;;99966V*��U����C������J��k�L�Q0 ��^\\j�C���q����7����n;v��������G�����\\sM|L��|���&u�(�HO/.�˕������ݻw�x�Ĺ�sF�x�\'������k&u�(�HO/.�ˏ8a���~��ϝ[=k$�[�|�Ν;����.W~�ԅ�`@\"=���.?���*	�y#}|��[���7�.W~�ԅ�`@\"=���.\'���w�zu�l�3>������g]��2�G��Dzzq�]���R���cK�kg�vƩ�?ٱ㭋��Y�.�L��Q0 ��^\\j�333SSS�k�����������k��������t֥�#��pH����������/��K	���?��G�G�F�=�w6���ځ/~�k�=s׹���]����[�����������n&�ۇ���f]�<2�G��Dzzq��vI���4m϶-[###>x�����w�T�^��Y��>=E���ջ��xl5:q6:�|�T���E_��}�\'�O�8u����p֥ˣ��8}C��Dzzq�!dw�Lmɾ��۶m{��c�k��#ޅ��Gg�_�im���/}�?�W~�/?��kQ��Z��j��j�E��}%d�\Z�Q�Z���R8\n$�Ӌ�!��\rW�g�+o8��5�Y%(?[�ע�g�s�_X`ee�S�������\'��9,��ѹJ�����5�w�F��E��Q0 ��^\\����r�7����q���nj�yV	��WB�������V���ٳ#�_>4�ʡ��w��5�w���\r��Q��o��pH��W�Tں���1Z�6���W�k��V��3�Q}���3���FO<���^��׽�.���L��e!��on��@���}�8,��`@\"=��FGG�9қ�JJ���c7\\��+E6���Wj#���z�t��3�O>�v��[v\\�_x�e�~���������蹳�x����;P�p��\r��pH��������B�z�lx��,���Z�\Z{�{B��kk?�����9����\'�ǟ]���������<q6�q9z��<�1����n��@���}�8,��`@\"=�����fffz�@]�줗����<k�co����=t����,�qx�{��y������z���9|����ǽ�?t����g��w��ݙ�]!;W��Q0 ��^\\��\Z��G�?C�ϖ�[�^+��.�>	+!�����×����]�j��@�B}�8,��`@\"=��GFF��Q��\'��_s�UB�I��Q܊o)��pH���V��c��r�tt.u��<���?et:\nZ�������B;p��޽{�b�)o��|SGo�њ���4:�+to8,��`@\"=����r�TZ^^�zCW%d?at:t����Q0 Q��>�\\��O]�<�\'A,,,���e����lt:L����Q0 Q7!���������8	e߾}[���fgg�>\\����N��ߒ�R8\n$J�?�$�w�������������J�҇�=Z=�/��҃6�*d�9,��`@�.�ɮ��N�(�ө���R��o�>/��\\._t�E���U�z՛����g�+!�G]��J\Z֖��ms\rm�?iÂ�rv%�/��pH�MȮ����5�\\{�M�VVV�G�����Bo>t}l߾��7�K.���k���wT9�ϟ��Q[O�eR֓�m��7���ͺ�y�����z��?��@ã�_��������|����6�#�;��nF��]NyІ;6,�����O���^g=Q��a)���k?���>��Lv�I�@n]v�e�Y0Q������L��݌�5�ߚ��[,_�м��]�چ�m���u�U�#��pH�aO����u�Lv$dS4+++�Szdd�}�{_�uvv�vk%t��~$��-��r�2�_S���j�n\r���UeX��rX\nG��D�=�9�L�m.��CCN<��#������Rizz��-\\*���G�jӿmy}�r���\\��vOM����Q0 QROox6��rC�n�6=d�|�rknnnff��[eoE��p�-�O�)�:����/�ͅ��������)Y�����A_���G�)��Ű��d��j_�/4,�r�~�)��~��.]9,��`@�nB�P���-E��o^��B�\\_\n8�Ya�2��6/�����|!�nf]�<rX\nG��Dz:t��>8�Ya�2՛j4/Y͆�kkKY�w3����R8\n$�ӡ�������&-S}����_vM��̺ty�����t�F%t2�^��xS�+=�7߱y����y���lng�.]9,��`@\"=�Q	�ǌN��Ӓ�R8\n$�ӡ�������yZrX\nG��Dz:tC��rX\nG��Dz:t#�A��G�N��Ӓ�R8\n$�ӡ���}�ӡ������t�F%d/\Z���%��pH��C7*!�{F�C�i�a)��Ѝ���3g�]_�����yZrX\nG��Dz:t�T*=�����4:\Z:OKK�(�HO�n���u����;F��{�_\Zɺty�!����t���������<�k���\'����.]iȅ�`@\"=����42�3�{֣�6���o���e]�<ҐG��Dz:ti�{֣��vƿ�����x�E�)\r�pH��C���������(��H�˷���ie�����S\Zr�(�HO��-..��^��8EG��\'�������e]��ҐG��Dz:q�С8g���\'Qt��<��>92RZX���k\Zr�(�HO�P��������33��|k6VV�{v�o&\'wOL�ŗ�.Q�iȅ�`@\"=�ZXX������~���m�.���:��Y���4�Q0 ���\Zr�(�HO�	\r�pH��䄆\\8\n$��rBC.��\09�!����t��АG��Dz:@Nhȅ�`@\"= \'4��Q0 ���\Zr�(�HO�	\r�pH��䄆\\8\n$��rBC.��\09�!����t��АG��Dz:@Nhȅ�`@\"= \'4��Q0 ���\Zr�(�HO�	\r�pH��䄆\\8\n$��rBC.��\09�!����t��АG��Dz:@Nhȅ�`@\"= \'4��Q0 ���\Zr�(�HO�	\r�pH��䄆\\8\n$��rBC.��\09�!����t��АG��D����r9�\0@�.�J������\0!�xH4::z�ȑ��`�-//o߾=뭠3B6�hlllaa!�\0tKKK�R)뭠3B6�hjjjff&�\0t������Yo���Dqsv�[0��Ud�tF�-..���d�\0�n|||~~>뭠3B6���>dkyy�T*yC����4ػwo�[0�����4�r�T*-//g�!\0�H..!�������X�[0���Sq	������珕\0=v���={�d�l��\r�ezzz|||ee%�\r��ryjjJ�.4!h���|�Tڷo�Wl������֫D�N�:w�8d��||<��C��������\'&&��w�^�e�!�X�\\����C����\0]�������ܜW��\r!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 0!\0\0�\0 ����ͳ��\0\0\0\0IEND�B`�',0),('150005',1,'StudentLeaveProcess01.bpmn','150003','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"studentLeaveProcess\" name=\"Student Levae process\" isExecutable=\"true\">\n    <startEvent id=\"startevent1\" name=\"Start\" activiti:initiator=\"startUserId\"></startEvent>\n    <userTask id=\"usertask1\" name=\"提交请假单\" activiti:assignee=\"${startUserId}\"></userTask>\n    <userTask id=\"usertask2\" name=\"班长审批\" activiti:candidateGroups=\"bz\" activiti:formKey=\"audit_bz.jsp\"></userTask>\n    <userTask id=\"usertask3\" name=\"班主任审批\" activiti:candidateGroups=\"bzr\" activiti:formKey=\"audit_ld.jsp\"></userTask>\n    <userTask id=\"usertask4\" name=\"系辅导员审批\" activiti:candidateGroups=\"xfdy\" activiti:formKey=\"audit_ld.jsp\"></userTask>\n    <userTask id=\"usertask5\" name=\"学生处审批\" activiti:candidateGroups=\"xsc\" activiti:formKey=\"audit_ld.jsp\"></userTask>\n    <endEvent id=\"endevent1\" name=\"End\">\n      <extensionElements>\n        <activiti:executionListener event=\"end\" class=\"com.xing.leaveSystem.listener.ProcessCompleteListener\"></activiti:executionListener>\n      </extensionElements>\n    </endEvent>\n    <exclusiveGateway id=\"exclusivegateway1\" name=\"Exclusive Gateway\" default=\"flow6\"></exclusiveGateway>\n    <sequenceFlow id=\"flow1\" sourceRef=\"startevent1\" targetRef=\"usertask1\"></sequenceFlow>\n    <sequenceFlow id=\"flow2\" sourceRef=\"usertask1\" targetRef=\"usertask2\"></sequenceFlow>\n    <sequenceFlow id=\"flow3\" name=\"通过\" sourceRef=\"usertask2\" targetRef=\"exclusivegateway1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${msg==\'通过\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow4\" name=\"大于3天\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask3\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${days<3}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow5\" name=\"3天到7天\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask4\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${days>=3 && days<=7}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow6\" name=\"大于7天\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask5\"></sequenceFlow>\n    <sequenceFlow id=\"flow7\" sourceRef=\"usertask3\" targetRef=\"endevent1\"></sequenceFlow>\n    <sequenceFlow id=\"flow8\" sourceRef=\"usertask4\" targetRef=\"endevent1\"></sequenceFlow>\n    <sequenceFlow id=\"flow9\" sourceRef=\"usertask5\" targetRef=\"endevent1\"></sequenceFlow>\n    <sequenceFlow id=\"flow10\" name=\"未通过\" sourceRef=\"usertask2\" targetRef=\"endevent1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${msg==\'未通过\'}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_studentLeaveProcess\">\n    <bpmndi:BPMNPlane bpmnElement=\"studentLeaveProcess\" id=\"BPMNPlane_studentLeaveProcess\">\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"60.0\" y=\"120.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask1\" id=\"BPMNShape_usertask1\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"140.0\" y=\"110.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask2\" id=\"BPMNShape_usertask2\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"300.0\" y=\"110.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask3\" id=\"BPMNShape_usertask3\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"630.0\" y=\"40.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask4\" id=\"BPMNShape_usertask4\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"630.0\" y=\"110.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask5\" id=\"BPMNShape_usertask5\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"630.0\" y=\"180.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"810.0\" y=\"120.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway1\" id=\"BPMNShape_exclusivegateway1\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"480.0\" y=\"117.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\n        <omgdi:waypoint x=\"95.0\" y=\"137.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"140.0\" y=\"137.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"245.0\" y=\"137.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"300.0\" y=\"137.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"405.0\" y=\"137.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"480.0\" y=\"137.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"420.0\" y=\"120.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"500.0\" y=\"117.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"500.0\" y=\"67.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"630.0\" y=\"67.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"42.0\" x=\"531.0\" y=\"51.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\">\n        <omgdi:waypoint x=\"520.0\" y=\"137.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"630.0\" y=\"137.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"48.0\" x=\"530.0\" y=\"120.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\n        <omgdi:waypoint x=\"500.0\" y=\"157.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"500.0\" y=\"207.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"630.0\" y=\"207.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"42.0\" x=\"531.0\" y=\"187.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow7\" id=\"BPMNEdge_flow7\">\n        <omgdi:waypoint x=\"682.0\" y=\"95.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"827.0\" y=\"120.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow8\" id=\"BPMNEdge_flow8\">\n        <omgdi:waypoint x=\"735.0\" y=\"137.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"810.0\" y=\"137.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow9\" id=\"BPMNEdge_flow9\">\n        <omgdi:waypoint x=\"682.0\" y=\"180.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"827.0\" y=\"155.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow10\" id=\"BPMNEdge_flow10\">\n        <omgdi:waypoint x=\"352.0\" y=\"165.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"352.0\" y=\"280.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"600.0\" y=\"280.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"827.0\" y=\"280.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"827.0\" y=\"155.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"36.0\" x=\"360.0\" y=\"200.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0);

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

insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('150010','studentLeaveProcess:1:150006','150007','150007','startevent1',NULL,NULL,'Start','startEvent',NULL,'2017-01-05 10:48:08','2017-01-05 10:48:08',13,''),('150012','studentLeaveProcess:1:150006','150007','150007','usertask1','150013',NULL,'提交请假单','userTask','297ecaa059435c720159435c72170000','2017-01-05 10:48:08','2017-01-05 10:48:14',6103,''),('150014','studentLeaveProcess:1:150006','150007','150007','usertask2','150015',NULL,'班长审批','userTask','297ecaa059435c720159435ca8a00001 ','2017-01-05 10:48:14','2017-01-05 10:50:15',121574,''),('150019','studentLeaveProcess:1:150006','150007','150007','exclusivegateway1',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2017-01-05 10:50:15','2017-01-05 10:50:15',1,''),('150020','studentLeaveProcess:1:150006','150007','150007','usertask4','150021',NULL,'系辅导员审批','userTask','297ecaa0596c71ec01596c71eca30000 ','2017-01-05 10:50:15','2017-01-05 10:52:42',147215,''),('150024','studentLeaveProcess:1:150006','150007','150007','endevent1',NULL,NULL,'End','endEvent',NULL,'2017-01-05 10:52:42','2017-01-05 10:52:42',6,'');

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

insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`) values ('150013','studentLeaveProcess:1:150006','usertask1','150007','150007','提交请假单',NULL,NULL,NULL,'297ecaa059435c720159435c72170000','2017-01-05 10:48:08',NULL,'2017-01-05 10:48:14',6093,'completed',50,NULL,NULL,NULL,''),('150015','studentLeaveProcess:1:150006','usertask2','150007','150007','班长审批',NULL,NULL,NULL,'297ecaa059435c720159435ca8a00001 ','2017-01-05 10:48:14','2017-01-05 10:49:45','2017-01-05 10:50:15',121558,'completed',50,NULL,'audit_bz.jsp',NULL,''),('150021','studentLeaveProcess:1:150006','usertask4','150007','150007','系辅导员审批',NULL,NULL,NULL,'297ecaa0596c71ec01596c71eca30000 ','2017-01-05 10:50:15','2017-01-05 10:52:33','2017-01-05 10:52:42',147209,'completed',50,NULL,'audit_ld.jsp',NULL,'');

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

insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('150008','150007','150007',NULL,'startUserId','string',1,NULL,NULL,NULL,'297ecaa059435c720159435c72170000',NULL,'2017-01-05 10:48:08','2017-01-05 10:52:42'),('150011','150007','150007',NULL,'days','integer',1,NULL,NULL,3,'3',NULL,'2017-01-05 10:48:08','2017-01-05 10:52:42'),('150018','150007','150007',NULL,'msg','string',1,NULL,NULL,NULL,'通过',NULL,'2017-01-05 10:50:15','2017-01-05 10:52:42');

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

insert  into `act_id_group`(`ID_`,`REV_`,`NAME_`,`TYPE_`) values ('bz',1,'班长',NULL),('bzr',1,'班主任',NULL),('gly',1,'管理员',NULL),('xfdy',1,'系辅导员',NULL),('xs',1,'学生',NULL),('xsc',1,'学生处',NULL);

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

insert  into `leave_system_group`(`group_id`,`name`) values ('bz','班长'),('bzr','班主任'),('gly','管理员'),('xfdy','系辅导员'),('xs','学生'),('xsc','学生处');

/*Table structure for table `leave_system_his_leave` */

DROP TABLE IF EXISTS `leave_system_his_leave`;

CREATE TABLE `leave_system_his_leave` (
  `leave_id` varchar(64) collate utf8_bin NOT NULL,
  `user_id` varchar(64) collate utf8_bin default NULL,
  `leavename` varchar(64) collate utf8_bin default NULL,
  `leavedays` int(11) default NULL COMMENT '天数',
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
  `leavedays` int(11) default NULL COMMENT '天数',
  `status` varchar(64) collate utf8_bin default NULL,
  `createtime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `endtime` timestamp NOT NULL default '0000-00-00 00:00:00',
  `processInstance_id` varchar(64) collate utf8_bin default NULL,
  `leaveReason` text collate utf8_bin,
  PRIMARY KEY  (`leave_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `leave_system_leave` */

insert  into `leave_system_leave`(`leave_id`,`user_id`,`leavename`,`leavedays`,`status`,`createtime`,`endtime`,`processInstance_id`,`leaveReason`) values ('297ecaa0596c86c501596c86c5f30000','297ecaa059435c720159435c72170000',NULL,3,'审核通过','2017-01-05 10:52:42','2017-01-05 10:48:09','150007','是是是');

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
