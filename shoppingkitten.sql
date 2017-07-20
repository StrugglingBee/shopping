/*
Navicat MySQL Data Transfer

Source Server         : mysql55
Source Server Version : 50554
Source Host           : localhost:3306
Source Database       : shoppingkitten

Target Server Type    : MYSQL
Target Server Version : 50554
File Encoding         : 65001

Date: 2017-07-12 19:13:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address_area
-- ----------------------------
DROP TABLE IF EXISTS `address_area`;
CREATE TABLE `address_area` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `pid` int(20) DEFAULT NULL,
  `lable` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address_area
-- ----------------------------
INSERT INTO `address_area` VALUES ('1', '中国', '0', '0');
INSERT INTO `address_area` VALUES ('2', '河南', '1', '1');
INSERT INTO `address_area` VALUES ('4', '湖南', '1', '1');
INSERT INTO `address_area` VALUES ('5', '郑州', '2', '2');
INSERT INTO `address_area` VALUES ('8', '高新区,', '5', '3');
INSERT INTO `address_area` VALUES ('10', '长沙', '4', '2');
INSERT INTO `address_area` VALUES ('17', '金水区,', '5', '0');
INSERT INTO `address_area` VALUES ('21', '中原区,', '5', '0');
INSERT INTO `address_area` VALUES ('23', '新乡市,', '2', '0');
INSERT INTO `address_area` VALUES ('24', '洛阳市,,,', '2', '0');

-- ----------------------------
-- Table structure for address_courier
-- ----------------------------
DROP TABLE IF EXISTS `address_courier`;
CREATE TABLE `address_courier` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address_courier
-- ----------------------------
INSERT INTO `address_courier` VALUES ('7', '顺丰', '2017-07-03 17:25:51');
INSERT INTO `address_courier` VALUES ('8', '天天', '2017-07-03 17:07:24');
INSERT INTO `address_courier` VALUES ('9', '申通', '2017-07-03 17:07:27');
INSERT INTO `address_courier` VALUES ('10', '圆通', '2017-07-03 17:07:42');
INSERT INTO `address_courier` VALUES ('12', '韵达', '2017-07-03 17:07:56');
INSERT INTO `address_courier` VALUES ('13', 'aaaa', '2017-07-12 16:33:52');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text,
  `images` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '<p>正品保障服务 正品保障服务是指卖家签署了山山商城消费者保障服务协议，承诺为消费者提供正品保障服务。当买家购买了山山商城&ldquo;正品保障&rdquo;的食品，收到货物时接受正品检验，如果卖家未履行承诺，买家可以根据本页面及山山商城规则规定向山山商城发起赔付申请，山山商城核实后将先行赔付，并增加赔偿其受到的损失，增加赔偿的金额为买家实际支付食品价款的五倍，并承担维权所涉食品所有物流费用。若如国家相关法律法规规定的赔付标准高于本协议的，您同意以法律法规规定为准。</p>\r\n', null, '保障范围');
INSERT INTO `article` VALUES ('2', '<h1>退货退款流程</h1>\r\n\r\n<p><strong>1、退换货原则：</strong></p>\r\n\r\n<p>如是产品质量原因，经确认无误后，我们将为您免费退换货。</p>\r\n\r\n<p>质量原因包括：<br />\r\n1) 产品外包装损坏；<br />\r\n2) 产品出现胀袋、漏袋等；<br />\r\n3) 产品超过出厂指定保质期；<br />\r\n4) 产品不符合国家标准、行业标准。<br />\r\n非质量原因将无法进行退货，包括：<br />\r\n1) 图片及信息仅供参照，商品将以实物为准。因拍摄灯光及不同显示器色差等问题可能造成商品图片与实物有一定色差，不属质量问题；<br />\r\n2) 凡因客户操作不当造成的商品损坏，不予退换(若因产品自身质量问题造成的除外)；<br />\r\n3）客户个人喜好等原因。不予退还；<br />\r\n4）办理退换货时需要提供完整的产品外包装、原产品、发货单、退换货原因，由于客户原因无法退回商品发货单的，将可能导致无法进行退货；<br />\r\n5）退货发生时，由于客户原因造成的退货，我们只退回商品的货款金额，原订单如有相应运费，恕不退还；由于客服引起的商品质量问题而造成的退货，将退还商品货款金额及相应运费；<br />\r\n6）订单中有赠品，需将赠品一同退回，如赠品一经拆包或使用，则订单商品只换不退。如有不便，敬请谅解；<br />\r\n7）一张订单只能进行一次退换货操作，为了确保您的权益，请考虑周全后再进行退换货。<br />\r\n<strong>2、退换货流程</strong><br />\r\n1）如果您需要办理退货，请您务必先与在线客服联系，或拨打客服热线400-826-3360；<br />\r\n2）邮寄商品，请将需办理退换货的商品寄到客服部，并在附言说明订单号、昵称、办理退货或换货、商品名称、退（换）货原因；<br />\r\n3）商品进行换货后并由仓库发出时，客服会通知您。若办理退货，货款会按照订购商品时的方式退还；因质量问题（非人为损坏）造成的退（换）货，邮寄费用将由我们承担。<br />\r\n说明:所退商品必须有良好的包装（包括填充物及外包装箱），如有小件物品零散置于包装中，请放入足够的填充物保证运输过程安全。</p>\r\n\r\n<p>&nbsp;</p>\r\n', null, '退货退款流程');
INSERT INTO `article` VALUES ('18', '', null, '消费者维权中心');
INSERT INTO `article` VALUES ('19', '<h1>用户注册协议</h1>\r\n\r\n<h1 style=\"text-align:center\">《山山商城服务协议》</h1>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;本协议由您与山山商城平台的经营者共同缔结，山山商城的销售渠道包括旗舰店、专卖店及自营店等模式。本协议具有合同效力，您必须完全同意本协议，才能够享受本网站提供的服务。您在山山商城登录即表示您完全接受本协议的全部条款。</p>\r\n\r\n<p><strong>一、服务条款的确认和接纳</strong><br />\r\n1、本协议内容包括协议正文及所有山山商城已经发布的或将来可能发布的各类规则。所有规则为本协议不可分割的组成部分，与协议正文具有同等法律效力。除另行明确声明外，任何山山商城提供的服务均受本协议约束。<br />\r\n2.您应当在使用山山商城服务之前认真阅读全部协议内容。如您对协议有任何疑问的，应向山山商城咨询。但无论您事实上是否在使用山山商城服务之前认真阅读了本协议内容，只要您使用山山商城服务，则本协议即对您产生约束，届时您不应以未阅读本协议的内容或者未获得山山商城对您问询的解答等理由，主张本协议无效，或要求撤销本协议。<br />\r\n3.您承诺接受并遵守本协议的约定。如果您不同意本协议的约定，您应立即停止注册程序或停止使用山山商城服务。<br />\r\n4.山山商城有权根据需要不时地制订、修改本协议及/或各类规则，并以网站公示的方式进行公告，不再单独通知您。变更后的协议和规则一经在网站公布后，立即自动生效。如您不同意相关变更，应当立即停止使用山山商城服务。您继续使用山山商城服务的，即表示您接受经修订的协议和规则。山山商城网站各项服务的所有权和运作权归本网站拥有。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>二、用户管理</strong><br />\r\n<strong>（一）用户资格</strong><br />\r\n只有符合下列条件之一的人员或实体才能申请成为本网站用户，可使用本网站的服务。<br />\r\n1.年满十八岁，并具有民事权利能力和民事行为能力的自然人；<br />\r\n2.未满十八岁，但监护人（包括但不仅限于父母）予以书面同意的自然人；<br />\r\n3.根据中国法律或设立地法律、法规和/或规章成立并合法存在的公司、企事业单位、社团组织和其他组织。无民事行为能力人、限制民事行为能力人以及无经营或特定经营资格的组织不当注册为本网站用户或超过其民事权利或行为能力范围从事交易的，其与本网站之间的协议自始无效，本网站一经发现，有权立即注销该用户，并追究其使用本网站&ldquo;服务&rdquo;的一切法律责任。<br />\r\n若您不具备前述主体资格，则您及您的监护人应承担因此而导致的一切后果，且山山商城有权注销（永久冻结）您的山山商城账户，并向您及您的监护人索偿。<br />\r\n<strong>（二）账户</strong><br />\r\n在您签署本协议，完成会员注册程序或以其他山山商城允许的方式实际使用山山商城服务时，山山商城会向您提供唯一编号的山山商城账户（以下亦称账户）。<br />\r\n您可以对账户设置会员名和密码，通过该会员名密码或与该会员名密码关联的其它用户名密码登录山山商城。您设置的会员名不得侵犯或涉嫌侵犯他人合法权益。如您连续一年未使用您的会员名和密码登录山山商城，或您设置的会员名涉嫌侵犯他人合法权益，山山商城有权终止向您提供山山商城服务，注销您的账户。账户注销后，相应的会员名将开放给任意用户注册登记使用。<br />\r\n您应对您的账户（会员名）和密码的安全，以及对通过您的账户（会员名）和密码实施的行为负责。除非有法律规定或司法裁定，且征得山山商城的同意，否则，账户（会员名）和密码不得以任何方式转让、赠与或继承（与账户相关的财产权益除外）。如果发现任何人不当使用您的账户或有任何其他可能危及您的账户安全的情形时，您应当立即以有效方式通知山山商城，要求山山商城暂停相关服务。您理解山山商城对您的请求采取行动需要合理时间，山山商城对在采取行动前已经产生的后果（包括但不限于您的任何损失）不承担任何责任。<br />\r\n为方便您使用山山商城服务，您同意并授权山山商城将您在注册、使用山山商城服务过程中提供、形成的信息传递给向您提供其他服务的山山商城关联公司或其他组织，或从提供其他服务的山山商城关联公司或其他组织获取您在注册、使用其他服务期间提供、形成的信息。</p>\r\n\r\n<p><br />\r\n<strong>（三）会员</strong><br />\r\n山山商城的会员包括买家用户和卖家用户。<br />\r\n山山商城对会员的管理依据国家法律、地方法律和国际法律等标准。<br />\r\n在您按照注册页面提示填写信息、阅读并同意本协议并完成全部注册程序后或以其他山山商城允许的方式实际使用山山商城服务时，您即成为山山商城会员（亦称会员）。<br />\r\n在注册时，您应当按照法律法规要求，或注册页面的提示准确提供，并及时更新您的资料，以使之真实、及时，完整和准确。如有合理理由怀疑您提供的资料错误、不实、过时或不完整的，山山商城有权向您发出询问及/或要求改正的通知，并有权直接做出删除相应资料的处理，直至中止、终止对您提供部分或全部山山商城服务。山山商城对此不承担任何责任，您将承担因此产生的任何直接或间接支出。<br />\r\n您应当准确填写并及时更新您提供的电子邮件地址、联系电话、联系地址、邮政编码等联系方式，以便山山商城或其他会员与您进行有效联系，因通过这些联系方式无法与您取得联系，导致您在使用山山商城服务过程中产生任何损失或增加费用的，应由您完全独自承担。<br />\r\n您在使用山山商城服务过程中，所产生的应纳税赋，以及一切硬件、软件、服务及其它方面的费用，均由您独自承担。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>三、山山商城服务</strong><br />\r\n1.通过山山商城及其关联公司提供的山山商城服务和其它服务，会员可在山山商城上发布交易信息、查询商品和服务信息、达成交易意向并进行交易、对其他会员进行评价、参加山山商城组织的活动以及使用其它信息服务及技术服务。<br />\r\n2.您在山山商城上交易过程中与其他会员发生交易纠纷时，一旦您或其它会员任一方或双方共同提交山山商城要求调处，则山山商城有权根据单方判断做出调处决定，您了解并同意接受山山商城的判断和调处决定。<br />\r\n3.您了解并同意，山山商城有权应政府部门（包括司法及行政部门）的要求，向其提供您在山山商城填写的注册信息和交易记录等必要信息。如您涉嫌侵犯他人知识产权，则山山商城亦有权在初步判断涉嫌侵权行为存在的情况下，向权利人提供您必要的身份信息。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>四、山山商城服务使用规范</strong><br />\r\n1.在山山商城上使用山山商城服务过程中，您承诺遵守以下约定：<br />\r\na)在使用山山商城服务过程中实施的所有行为均遵守国家法律、法规等规范性文件及山山商城各项规则的规定和要求，不违背社会公共利益或公共道德，不损害他人的合法权益，不违反本协议及相关规则。您如果违反前述承诺，产生任何法律后果的，您应以自己的名义独立承担所有的法律责任，并确保山山商城免于因此产生任何损失。<br />\r\nb)在与其他会员交易过程中，遵守诚实信用原则，不采取不正当竞争行为，不扰乱网上交易的正常秩序，不从事与网上交易无关的行为。<br />\r\nc)不发布国家禁止销售的或限制销售的商品或服务信息（除非取得合法且足够的许可），不发布涉嫌侵犯他人知识产权或其它合法权益的商品或服务信息，不发布违背社会公共利益或公共道德或山山商城认为不适合在山山商城上销售的商品或服务信息，不发布其它涉嫌违法或违反本协议及各类规则的信息。<br />\r\nd)不以虚构或歪曲事实的方式不当评价其他会员，不采取不正当方式制造或提高自身的信用度，不采取不正当方式制造或提高（降低）其他会员的信用度；<br />\r\ne)不对山山商城上的任何数据作商业性利用，包括但不限于在未经山山商城事先书面同意的情况下，以复制、传播等任何方式使用山山商城站上展示的资料。<br />\r\nf)不使用任何装置、软件或例行程序干预或试图干预山山商城的正常运作或正在山山商城上进行的任何交易、活动。您不得采取任何将导致不合理的庞大数据负载加诸山山商城网络设备的行动。<br />\r\n2.您了解并同意：<br />\r\na)山山商城有权对您是否违反上述承诺做出单方认定，并根据单方认定结果适用规则予以处理或终止向您提供服务，且无须征得您的同意或提前通知予您。<br />\r\nb)基于维护山山商城交易秩序及交易安全的需要，山山商城有权在发生恶意购买等扰乱市场正常交易秩序的情形下，执行关闭相应交易订单等操作。<br />\r\nc)经国家行政或司法机关的生效法律文书确认您存在违法或侵权行为，或者山山商城根据自身的判断，认为您的行为涉嫌违反本协议和/或规则的条款或涉嫌违反法律法规的规定的，则山山商城有权在山山商城上公示您的该等涉嫌违法或违约行为及山山商城已对您采取的措施。<br />\r\nd)对于您在山山商城上发布的涉嫌违法或涉嫌侵犯他人合法权利或违反本协议和/或规则的信息，山山商城有权不经通知您即予以删除，且按照规则的规定进行处罚。<br />\r\ne)对于您在山山商城上实施的行为，包括您未在山山商城上实施但已经对山山商城及其用户产生影响的行为，山山商城有权单方认定您行为的性质及是否构成对本协议和/或规则的违反，并据此作出相应处罚。您应自行保存与您行为有关的全部证据，并应对无法提供充要证据而承担的不利后果。<br />\r\nf)对于您涉嫌违反承诺的行为对任意第三方造成损害的，您均应当以自己的名义独立承担所有的法律责任，并应确保山山商城免于因此产生损失或增加费用。<br />\r\ng)如您涉嫌违反有关法律或者本协议之规定，使山山商城遭受任何损失，或受到任何第三方的索赔，或受到任何行政管理部门的处罚，您应当赔偿山山商城因此造成的损失及（或）发生的费用，包括合理的律师费用。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>五、特别授权</strong><br />\r\n您完全理解并不可撤销地授予山山商城及其关联公司下列权利：<br />\r\n1.您完全理解并不可撤销地授权山山商城或山山商城授权的第三方或您与山山商城一致同意的第三方，根据本协议及山山商城规则的规定，处理您在山山商城上发生的所有交易及可能产生的交易纠纷。您同意接受山山商城或山山商城授权的第三方或您与山山商城一致同意的第三方的判断和调处决定。该决定将对您具有法律约束力。<br />\r\n2.一旦您向山山商城及（或）其关联公司，包括但不限于支付宝、网上银行等作出任何形式的承诺，且相关公司已确认您违反了该承诺，则山山商城有权立即按您的承诺或协议约定的方式对您的账户采取限制措施，包括中止或终止向您提供服务，并公示相关公司确认的您的违约情况。您了解并同意，山山商城无须就相关确认与您核对事实，或另行征得您的同意，且山山商城无须就此限制措施或公示行为向您承担任何的责任。<br />\r\n3.一旦您违反本协议，或与山山商城签订的其他协议的约定，山山商城有权以任何方式通知山山商城关联公司，要求其对您的权益采取限制措施，包括但不限于要求支付宝公司将您账户内的款项支付给山山商城指定的对象，要求关联公司中止、终止对您提供部分或全部服务，且在其经营或实际控制的任何网站公示您的违约情况。<br />\r\n4.对于您提供的资料及数据信息，您授予山山商城及其关联公司独家的、全球通用的、永久的、免费的许可使用权利(并有权在多个层面对该权利进行再授权)。<br />\r\n此外，山山商城及其关联公司有权(全部或部份地)使用、复制、修订、改写、发布、翻译、分发、执行和展示您的全部资料数据（包括但不限于注册资料、交易行为数据及全部展示于山山商城的各类信息）或制作其派生作品，并以现在已知或日后开发的任何形式、媒体或技术，将上述信息纳入其它作品内。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>六、责任范围和责任限制</strong><br />\r\n1.山山商城负责按&quot;现状&quot;和&quot;可得到&quot;的状态向您提供山山商城服务。但山山商城对山山商城服务不作任何明示或暗示的保证，包括但不限于山山商城服务的适用性、没有错误或疏漏、持续性、准确性、可靠性、适用于某一特定用途。同时，山山商城也不对山山商城服务所涉及的技术及信息的有效性、准确性、正确性、可靠性、质量、稳定、完整和及时性作出任何承诺和保证。<br />\r\n2.您了解山山商城上的信息系用户自行发布，且可能存在风险和瑕疵。山山商城仅作为交易地点。山山商城仅作为您获取物品或服务信息、物色交易对象、就物品和/或服务的交易进行协商及开展交易的场所，但山山商城无法控制交易所涉及的物品的质量、安全或合法性，商贸信息的真实性或准确性，以及交易各方履行其在贸易协议中各项义务的能力。您应自行谨慎判断确定相关物品及/或信息的真实性、合法性和有效性，并自行承担因此产生的责任与损失。<br />\r\n3.除非法律法规明确要求，或出现以下情况，否则，山山商城没有义务对所有用户的注册数据、商品（服务）信息、交易行为以及与交易有关的其它事项进行事先审查：<br />\r\na)山山商城有合理的理由认为特定会员及具体交易事项可能存在重大违法或违约情形。<br />\r\nb)山山商城有合理的理由认为用户在山山商城的行为涉嫌违法或不当。<br />\r\n4.山山商城或山山商城授权的第三方或您与山山商城一致同意的第三方有权基于您不可撤销得授权受理您与其他会员因交易产生的争议，并有权单方判断与该争议相关的事实及应适用的规则，进而作出处理决定，包括但不限于调整相关订单的交易状态，指令支付宝公司将争议货款的全部或部分支付给交易一方或双方。该处理决定对您有约束力。如您未在限期内执行处理决定的，则山山商城有权利（但无义务）直接使用您支付宝账户内的款项，或您向山山商城及其关联公司交纳的保证金代为支付。您应及时补足保证金并弥补山山商城及其关联公司的损失，否则山山商城及其关联公司有权直接抵减您在其它合同项下的权益，并有权继续追偿。<br />\r\n您理解并同意，山山商城或山山商城授权的第三方或您与山山商城一致同意的第三方并非司法机构，仅能以普通人的身份对证据进行鉴别，山山商城或山山商城授权的第三方或您与山山商城一致同意的第三方对争议的调处完全是基于您不可撤销得授权，其无法保证争议处理结果符合您的期望，也不对争议调处结论承担任何责任。如您因此遭受损失，您同意自行向受益人索偿。<br />\r\n5.您了解并同意，山山商城不对因下述任一情况而导致您的任何损害赔偿承担责任，包括但不限于利润、商誉、使用、数据等方面的损失或其它无形损失的损害赔偿(无论山山商城是否已被告知该等损害赔偿的可能性)：<br />\r\na)使用或未能使用山山商城服务。<br />\r\nb)第三方未经批准的使用您的账户或更改您的数据。<br />\r\nc)通过山山商城服务购买或获取任何商品、样品、数据、信息或进行交易等行为或替代行为产生的费用及损失。<br />\r\nd)您对山山商城服务的误解。<br />\r\ne)任何非因山山商城的原因而引起的与山山商城服务有关的其它损失。<br />\r\n6.不论在何种情况下，山山商城均不对由于信息网络正常的设备维护，信息网络连接故障，电脑、通讯或其他系统的故障，电力故障，罢工，劳动争议，暴乱，起义，骚乱，生产力或生产资料不足，火灾，洪水，风暴，爆炸，战争，政府行为，司法行政机关的命令或第三方的不作为而造成的不能服务或延迟服务承担责任。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>七、协议终止</strong><br />\r\n1.您同意，山山商城有权自行全权决定以任何理由不经事先通知的中止、终止向您提供部分或全部山山商城服务，暂时冻结或永久冻结（注销）您的账户，且无须为此向您或任何第三方承担任何责任。<br />\r\n2.出现以下情况时，山山商城有权直接以注销账户的方式终止本协议:<br />\r\na)山山商城终止向您提供服务后，您涉嫌再一次直接或间接或以他人名义注册为山山商城用户的；<br />\r\nb)您提供的电子邮箱不存在或无法接收电子邮件，且没有其他方式可以与您进行联系，或山山商城以其它联系方式通知您更改电子邮件信息，而您在山山商城通知后三个工作日内仍未更改为有效的电子邮箱的。<br />\r\nc)您注册信息中的主要内容不真实或不准确或不及时或不完整。<br />\r\nd)本协议（含规则）变更时，您明示并通知山山商城不愿接受新的服务协议的；<br />\r\ne)其它山山商城认为应当终止服务的情况。<br />\r\n3.您有权向山山商城要求注销您的账户，经山山商城审核同意的，山山商城注销（永久冻结）您的账户，届时，您与山山商城基于本协议的合同关系即终止。您的账户被注销（永久冻结）后，山山商城没有义务为您保留或向您披露您账户中的任何信息，也没有义务向您或第三方转发任何您未曾阅读或发送过的信息。<br />\r\n4.您同意，您与山山商城的合同关系终止后，山山商城仍享有下列权利：<br />\r\na)继续保存您的注册信息及您使用山山商城服务期间的所有交易信息。<br />\r\nb)您在使用山山商城服务期间存在违法行为或违反本协议和/或规则的行为的，山山商城仍可依据本协议向您主张权利。<br />\r\n5.山山商城中止或终止向您提供山山商城服务后，对于您在服务中止或终止之前的交易行为依下列原则处理，您应独力处理并完全承担进行以下处理所产生的任何争议、损失或增加的任何费用，并应确保山山商城免于因此产生任何损失或承担任何费用：<br />\r\na)您在服务中止或终止之前已经上传至山山商城的物品尚未交易的，山山商城有权在中止或终止服务的同时删除此项物品的相关信息；<br />\r\nb)您在服务中止或终止之前已经与其他会员达成买卖合同，但合同尚未实际履行的，山山商城有权删除该买卖合同及其交易物品的相关信息；<br />\r\nc)您在服务中止或终止之前已经与其他会员达成买卖合同且已部分履行的，山山商城可以不删除该项交易，但山山商城有权在中止或终止服务的同时将相关情形通知您的交易对方。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>八、隐私权政策</strong><br />\r\n山山商城将在山山商城公布并不时修订隐私权政策，隐私权政策构成本协议的有效组成部分。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>九、法律适用、管辖与其他</strong><br />\r\n1.本协议之效力、解释、变更、执行与争议解决均适用中华人民共和国大陆地区法律，如无相关法律规定的，则应参照通用国际商业惯例和（或）行业惯例。<br />\r\n2.本协议包含了您使用各家山山商城需遵守的一般性规范，您在使用某个山山商城时还需遵守适用于该平台的特殊性规范（具体请参见您与该平台签署的其他协议以及平台规则等内容）。一般性规范如与特殊性规范不一致或有冲突，则特殊性规范具有优先效力。<br />\r\n3.因本协议产生之争议需根据您使用的服务归属的平台确定具体的争议对象，例如因您使用山山商城服务所产生的争议应由山山商城的经营者与您沟通并处理。您与山山商城的经营者均同意以山山商城经营者住所地人民法院为第一审管辖法院。</p>\r\n', null, '免费注册');
INSERT INTO `article` VALUES ('20', null, null, '新手学堂');
INSERT INTO `article` VALUES ('21', null, null, '交易安全');
INSERT INTO `article` VALUES ('22', null, null, '消费警示');
INSERT INTO `article` VALUES ('23', null, null, '服务热线');
INSERT INTO `article` VALUES ('24', null, null, '网上银行');
INSERT INTO `article` VALUES ('25', null, null, '在线支付');
INSERT INTO `article` VALUES ('26', null, null, '山山商城');
INSERT INTO `article` VALUES ('27', null, null, '国内配送');
INSERT INTO `article` VALUES ('28', null, null, '海外配送');

-- ----------------------------
-- Table structure for cart_product
-- ----------------------------
DROP TABLE IF EXISTS `cart_product`;
CREATE TABLE `cart_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `p_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart_product
-- ----------------------------

-- ----------------------------
-- Table structure for column
-- ----------------------------
DROP TABLE IF EXISTS `column`;
CREATE TABLE `column` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of column
-- ----------------------------
INSERT INTO `column` VALUES ('1', '消费者保障', null);
INSERT INTO `column` VALUES ('2', '新手上路', null);
INSERT INTO `column` VALUES ('3', '支付方式', null);
INSERT INTO `column` VALUES ('4', '配送范围及时间', null);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `text` text,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `id_code` varchar(255) DEFAULT NULL,
  `nick_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('8', 'admin', 'password', '1111111111', '111111', '超级管理员');

-- ----------------------------
-- Table structure for manager_role
-- ----------------------------
DROP TABLE IF EXISTS `manager_role`;
CREATE TABLE `manager_role` (
  `mid` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager_role
-- ----------------------------
INSERT INTO `manager_role` VALUES ('2', '2');
INSERT INTO `manager_role` VALUES ('1', '1');
INSERT INTO `manager_role` VALUES ('1', '3');
INSERT INTO `manager_role` VALUES ('5', '1');
INSERT INTO `manager_role` VALUES ('8', '1');
INSERT INTO `manager_role` VALUES ('8', '2');
INSERT INTO `manager_role` VALUES ('8', '3');
INSERT INTO `manager_role` VALUES ('8', '4');
INSERT INTO `manager_role` VALUES ('8', '5');
INSERT INTO `manager_role` VALUES ('8', '6');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` varchar(255) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `aid` int(11) DEFAULT NULL,
  `money` double DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `send_id` int(11) DEFAULT NULL,
  `pay_method` varchar(255) DEFAULT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  `pay_status` varchar(255) DEFAULT NULL,
  `send_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for order_product
-- ----------------------------
DROP TABLE IF EXISTS `order_product`;
CREATE TABLE `order_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `p_num` int(11) DEFAULT NULL,
  `p_price` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_product
-- ----------------------------
INSERT INTO `order_product` VALUES ('1', '1', '1', '1', '1');
INSERT INTO `order_product` VALUES ('2', '2', '2', '2', '2');
INSERT INTO `order_product` VALUES ('3', '3', '3', '3', '3');

-- ----------------------------
-- Table structure for pingpai
-- ----------------------------
DROP TABLE IF EXISTS `pingpai`;
CREATE TABLE `pingpai` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pingpai` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pingpai
-- ----------------------------
INSERT INTO `pingpai` VALUES ('1', '梦格尔');
INSERT INTO `pingpai` VALUES ('2', '郑家屯');
INSERT INTO `pingpai` VALUES ('3', '金信');
INSERT INTO `pingpai` VALUES ('4', '山山');
INSERT INTO `pingpai` VALUES ('5', '骊山水更');
INSERT INTO `pingpai` VALUES ('6', '健康美食');
INSERT INTO `pingpai` VALUES ('7', '木玩世家');
INSERT INTO `pingpai` VALUES ('8', '远景');
INSERT INTO `pingpai` VALUES ('9', '沈克隆');
INSERT INTO `pingpai` VALUES ('10', '其二');
INSERT INTO `pingpai` VALUES ('11', '拉不多');
INSERT INTO `pingpai` VALUES ('12', '何以低价');
INSERT INTO `pingpai` VALUES ('13', '是啊是否是');
INSERT INTO `pingpai` VALUES ('14', '肌肤的');
INSERT INTO `pingpai` VALUES ('15', '浮动');
INSERT INTO `pingpai` VALUES ('16', '地方');
INSERT INTO `pingpai` VALUES ('17', '的是否按揭覅');
INSERT INTO `pingpai` VALUES ('18', '手动阀发');
INSERT INTO `pingpai` VALUES ('19', '第三方');
INSERT INTO `pingpai` VALUES ('20', '发电风扇');
INSERT INTO `pingpai` VALUES ('21', '打发第三方');
INSERT INTO `pingpai` VALUES ('22', '打发打发');
INSERT INTO `pingpai` VALUES ('23', null);

-- ----------------------------
-- Table structure for privilege
-- ----------------------------
DROP TABLE IF EXISTS `privilege`;
CREATE TABLE `privilege` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(255) DEFAULT NULL,
  `p_remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of privilege
-- ----------------------------
INSERT INTO `privilege` VALUES ('1', 'manager:*', '拥有全部管理权限');
INSERT INTO `privilege` VALUES ('9', 'manager:manager:*', '管理员账号管理所有权限');
INSERT INTO `privilege` VALUES ('10', 'manager:manager:add', '添加管理员账号');
INSERT INTO `privilege` VALUES ('11', 'manager:manager:select', '查询管理员账号权限');
INSERT INTO `privilege` VALUES ('12', 'manager:manager:remove', '删除管理员权限');
INSERT INTO `privilege` VALUES ('13', 'manager:manager:role', '分配管理员角色权限');
INSERT INTO `privilege` VALUES ('14', 'manager:user:*', '拥有管理用户的所有权限');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sale_price` float DEFAULT NULL,
  `price` float DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `sale_total` int(11) DEFAULT NULL,
  `face_image` varchar(255) DEFAULT NULL,
  `descripe` text,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '获取当前时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('17', '12', '飞利浦22222', '123', '123', '123', null, '2024/b8f924d5-fa29-4da2-85f0-dda62b35dca7.jpg', '<p>飞利浦精品商品</p>\r\n', '2017-07-02 17:07:34');
INSERT INTO `product` VALUES ('18', '12', '测试相机', '123', '321', '321', null, '2024/dc3fec74-0698-4c4f-a160-93af30103898.jpg', '<p>大刀阔斧就打开</p>\r\n', '2017-07-02 17:10:27');
INSERT INTO `product` VALUES ('19', '1', 'test222', '111', '111', '1111', null, '2024/8edccf2b-fd0e-4f10-8c1b-76c92d411eb0.jpg', '<p>fdsfjdklfjdlfjk</p>\r\n', '2017-07-02 17:44:07');
INSERT INTO `product` VALUES ('20', '12', 'kjfdjdk', '12', '12', '12', null, '2024/b632f8b2-b9a5-495c-85e2-bd0ceb89a5d7.jpg', '<p>gfhhfdgfsd</p>\r\n', '2017-07-02 17:47:30');
INSERT INTO `product` VALUES ('21', '12', 'fdfdklfjsd', '1213', '123', '232', null, '2024/e4d9e596-52de-4f3d-bfc5-75f871ac1ae0.jpg', '<p>gflgfdk;gkdfg;k</p>\r\n', '2017-07-02 17:48:06');
INSERT INTO `product` VALUES ('22', '12', 'abc', '11', '11', '11', null, '2024/10ef751b-11db-49cd-bf43-649ceb427364.jpg', '<p>abc</p>\r\n', '2017-07-02 19:07:26');
INSERT INTO `product` VALUES ('23', '8', '222', '11111', '111', '111', null, '2024/e6fe5d94-da80-49c5-92e8-b6417fb33b27.jpg', '<p>地方的韩国和规范</p>\r\n', '2017-07-02 19:36:37');
INSERT INTO `product` VALUES ('25', '17', '1111', '111', '11', '11', null, '20177/ba0d5884-6a3e-497c-b347-803e42a04cfd.jpg', '<p>dfdsgfgdfdgfdbcvsgdfb</p>\r\n', '2017-07-05 09:51:10');
INSERT INTO `product` VALUES ('26', '1', '3333', '3333', '111', '1111', null, '20177/2e1d28cf-fc9f-4253-a2bb-f51f66f6f8dd.jpg', '<p>etrgrr</p>\r\n', '2017-07-05 10:53:38');
INSERT INTO `product` VALUES ('27', '1', '222222222222', '1111', '111', '1111', null, '20177/7abce450-ac5c-433f-918a-2e34fc30a289.jpg', '<p>fdhgfhfdvfhgfd</p>\r\n\r\n<p>dsghjhhfg</p>\r\n', '2017-07-12 16:32:06');

-- ----------------------------
-- Table structure for product_type
-- ----------------------------
DROP TABLE IF EXISTS `product_type`;
CREATE TABLE `product_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_type
-- ----------------------------
INSERT INTO `product_type` VALUES ('1', '所有分类', '0');
INSERT INTO `product_type` VALUES ('2', '数码电器', '1');
INSERT INTO `product_type` VALUES ('8', '手机', '2');
INSERT INTO `product_type` VALUES ('10', '电视', '2');
INSERT INTO `product_type` VALUES ('11', '办公', '2');
INSERT INTO `product_type` VALUES ('12', '相机', '2');
INSERT INTO `product_type` VALUES ('13', '女装', '3');
INSERT INTO `product_type` VALUES ('14', '男装', '3');
INSERT INTO `product_type` VALUES ('15', '童装', '3');
INSERT INTO `product_type` VALUES ('16', '内衣', '3');
INSERT INTO `product_type` VALUES ('17', '袜子', '3');
INSERT INTO `product_type` VALUES ('18', '女包', '4');
INSERT INTO `product_type` VALUES ('19', '男鞋', '4');
INSERT INTO `product_type` VALUES ('20', '童鞋', '4');
INSERT INTO `product_type` VALUES ('37', '男包', '4');
INSERT INTO `product_type` VALUES ('38', '珠宝', '7');
INSERT INTO `product_type` VALUES ('40', '卫浴', '6');
INSERT INTO `product_type` VALUES ('44', '服饰珠宝', '3');
INSERT INTO `product_type` VALUES ('45', '服装鞋帽', '1');
INSERT INTO `product_type` VALUES ('46', '男装', '45');
INSERT INTO `product_type` VALUES ('47', '女装', '45');
INSERT INTO `product_type` VALUES ('48', '男鞋', '45');
INSERT INTO `product_type` VALUES ('49', '女鞋22', '45');

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `resource_id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES ('1', '会员管理', '', '0');
INSERT INTO `resource` VALUES ('2', '会员类型管理', '/admin/user_type.jsp', '1');
INSERT INTO `resource` VALUES ('3', '会员资料管理', '/admin/user.jsp', '1');
INSERT INTO `resource` VALUES ('4', '商品管理', null, '0');
INSERT INTO `resource` VALUES ('5', '商品类型管理', '/admin/ptype_manage.jsp', '4');
INSERT INTO `resource` VALUES ('6', '商品内容管理', '/admin/product.jsp', '4');
INSERT INTO `resource` VALUES ('7', '配送管理', null, '0');
INSERT INTO `resource` VALUES ('9', '快递管理', '/admin/courier.jsp', '7');
INSERT INTO `resource` VALUES ('12', '栏目管理', '', '0');
INSERT INTO `resource` VALUES ('13', '栏目类型', '/admin/column.jsp', '12');
INSERT INTO `resource` VALUES ('14', '文章管理', '/admin/article.jsp', '12');
INSERT INTO `resource` VALUES ('15', '系统管理', null, '0');
INSERT INTO `resource` VALUES ('16', '管理员管理', '/admin/manager.jsp', '15');
INSERT INTO `resource` VALUES ('19', '订单管理', '', '0');
INSERT INTO `resource` VALUES ('22', '权限管理', '/admin/privilege.jsp', '15');
INSERT INTO `resource` VALUES ('23', '资源管理', '/admin/resource.jsp', '15');
INSERT INTO `resource` VALUES ('27', '角色管理', '/admin/role.jsp', '15');
INSERT INTO `resource` VALUES ('28', '收货地址管理', '', '7');
INSERT INTO `resource` VALUES ('32', '订单综合管理', '', '19');
INSERT INTO `resource` VALUES ('33', '订单回访管理', '', '19');
INSERT INTO `resource` VALUES ('34', '配送地区管理', '/admin/area.jsp', '7');
INSERT INTO `resource` VALUES ('35', '未付款订单', '', '19');
INSERT INTO `resource` VALUES ('36', '未发货订单', '', '19');
INSERT INTO `resource` VALUES ('37', '未确认收货订单', '', '19');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员');
INSERT INTO `role` VALUES ('2', '系统管理员');
INSERT INTO `role` VALUES ('3', '会员管理员');
INSERT INTO `role` VALUES ('4', '商品管理员');
INSERT INTO `role` VALUES ('5', '配送管理员');
INSERT INTO `role` VALUES ('6', '栏目管理员');

-- ----------------------------
-- Table structure for role_privilege
-- ----------------------------
DROP TABLE IF EXISTS `role_privilege`;
CREATE TABLE `role_privilege` (
  `rid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_privilege
-- ----------------------------
INSERT INTO `role_privilege` VALUES ('3', '3');
INSERT INTO `role_privilege` VALUES ('2', '9');
INSERT INTO `role_privilege` VALUES ('1', '1');
INSERT INTO `role_privilege` VALUES ('1', '9');
INSERT INTO `role_privilege` VALUES ('1', '10');
INSERT INTO `role_privilege` VALUES ('1', '11');
INSERT INTO `role_privilege` VALUES ('1', '12');
INSERT INTO `role_privilege` VALUES ('1', '13');
INSERT INTO `role_privilege` VALUES ('1', '14');

-- ----------------------------
-- Table structure for role_resource
-- ----------------------------
DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource` (
  `rid` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_resource
-- ----------------------------
INSERT INTO `role_resource` VALUES ('3', '1');
INSERT INTO `role_resource` VALUES ('3', '2');
INSERT INTO `role_resource` VALUES ('3', '3');
INSERT INTO `role_resource` VALUES ('4', '4');
INSERT INTO `role_resource` VALUES ('4', '5');
INSERT INTO `role_resource` VALUES ('4', '6');
INSERT INTO `role_resource` VALUES ('5', '7');
INSERT INTO `role_resource` VALUES ('5', '28');
INSERT INTO `role_resource` VALUES ('5', '34');
INSERT INTO `role_resource` VALUES ('5', '9');
INSERT INTO `role_resource` VALUES ('6', '12');
INSERT INTO `role_resource` VALUES ('6', '14');
INSERT INTO `role_resource` VALUES ('6', '13');
INSERT INTO `role_resource` VALUES ('1', '1');
INSERT INTO `role_resource` VALUES ('1', '2');
INSERT INTO `role_resource` VALUES ('1', '3');
INSERT INTO `role_resource` VALUES ('1', '4');
INSERT INTO `role_resource` VALUES ('1', '5');
INSERT INTO `role_resource` VALUES ('1', '6');
INSERT INTO `role_resource` VALUES ('1', '7');
INSERT INTO `role_resource` VALUES ('1', '34');
INSERT INTO `role_resource` VALUES ('1', '28');
INSERT INTO `role_resource` VALUES ('1', '9');
INSERT INTO `role_resource` VALUES ('1', '12');
INSERT INTO `role_resource` VALUES ('1', '14');
INSERT INTO `role_resource` VALUES ('1', '13');
INSERT INTO `role_resource` VALUES ('1', '15');
INSERT INTO `role_resource` VALUES ('1', '27');
INSERT INTO `role_resource` VALUES ('1', '23');
INSERT INTO `role_resource` VALUES ('1', '16');
INSERT INTO `role_resource` VALUES ('1', '22');
INSERT INTO `role_resource` VALUES ('1', '19');
INSERT INTO `role_resource` VALUES ('1', '32');
INSERT INTO `role_resource` VALUES ('1', '36');
INSERT INTO `role_resource` VALUES ('1', '37');
INSERT INTO `role_resource` VALUES ('1', '33');
INSERT INTO `role_resource` VALUES ('1', '35');
INSERT INTO `role_resource` VALUES ('2', '1');
INSERT INTO `role_resource` VALUES ('2', '2');
INSERT INTO `role_resource` VALUES ('2', '3');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) DEFAULT '1',
  `name` varchar(255) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `login_count` int(11) DEFAULT '0',
  `login_error` int(11) DEFAULT '0',
  `create_ip` varchar(255) DEFAULT NULL,
  `member_integral` int(11) DEFAULT '0',
  `lock_time` int(11) DEFAULT '0',
  `status` varchar(255) DEFAULT 'online',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', '2', '张一', 'zhangsan', '123abc', '', '', null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('3', '1', '张二', 'aaa', 'aaa', '2822237263@qq.com', '18838091842', '2017-06-21 22:40:08', null, null, '10.8.159.43', null, null, 'online');
INSERT INTO `user` VALUES ('5', '2', '张三', 'bbb2', 'bbb', null, '18638865126', '2010-10-10 10:10:10', null, null, '10.8.159.43', null, null, 'online');
INSERT INTO `user` VALUES ('6', '1', '张四', 'aaa', 'aaa', null, '123456789', '2017-06-22 11:21:58', null, null, '0:0:0:0:0:0:0:1', null, null, 'online');
INSERT INTO `user` VALUES ('8', '1', '张五', 'ccc', 'ccc', null, '111', '2017-06-22 07:50:13', '0', '0', '0:0:0:0:0:0:0:1', '0', '0', 'online');
INSERT INTO `user` VALUES ('11', '1', '王一', 'ddd', '7c9b407f98187cb24fbab26fa1dc1daf', null, '11111', '2017-06-22 08:44:30', '1', '0', '0:0:0:0:0:0:0:1', '0', '0', 'online');
INSERT INTO `user` VALUES ('12', '1', '王二', '11111111111', 'e8d3ba8d1f0f24dfb2062e727a598b92', null, '123456789', '2017-06-22 09:37:26', '0', '0', '0:0:0:0:0:0:0:1', '0', '0', 'online');
INSERT INTO `user` VALUES ('32', '1', '王三', '228888', null, '2286027261@qq.com', '18838091842', null, '1', '1', '1', '0', '0', 'online');
INSERT INTO `user` VALUES ('40', '1', '王四', null, null, null, null, null, '0', '0', null, '0', '0', 'online');
INSERT INTO `user` VALUES ('41', '1', '王五', null, null, null, null, null, '0', '0', null, '0', '0', 'online');
INSERT INTO `user` VALUES ('42', '1', '赵一', 'fasfsadf', 'adsfasfdsaf', 'safdasfsadf', 'adfasfsadfsaf', null, '0', '0', null, '0', '0', 'online');
INSERT INTO `user` VALUES ('44', '1', '赵二', 'ggggg', 'gggg', 'gggg', 'ggg', null, '0', '0', null, '0', '0', 'online');
INSERT INTO `user` VALUES ('45', '1', '赵三', 'safasd', 'asdfsadf', 'asdfasdf', 'asdfasfd', null, '0', '0', null, '0', '0', 'online');
INSERT INTO `user` VALUES ('46', '1', '赵四', 'sadf', 'aasdff', 'asdfaasfdfdsas', 'asdfasfddfasdfdsaf', null, '0', '0', null, '0', '0', 'online');
INSERT INTO `user` VALUES ('47', '1', '赵五', 'sadfasdfas', 'aasdfasdfasfdf', 'asdfaaasdfsadfsfdfdsas', 'asdfasfdsfddfasdfdsaf', null, '0', '0', null, '0', '0', 'online');
INSERT INTO `user` VALUES ('48', '1', '钱一', 'fasdfsadfsadf', 'asdfsadfsadfdsa', 'asdfsafsafdsa', 'dsfsafasdfsadfsaf', null, '0', '0', null, '0', '0', 'online');
INSERT INTO `user` VALUES ('49', '1', '钱二', '李思思1', '989898', '2286027261@qq.com', '18838091842', null, '0', '0', null, '0', '0', 'online');

-- ----------------------------
-- Table structure for user-user_adress
-- ----------------------------
DROP TABLE IF EXISTS `user-user_adress`;
CREATE TABLE `user-user_adress` (
  `uid` int(11) DEFAULT NULL,
  `aid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user-user_adress
-- ----------------------------

-- ----------------------------
-- Table structure for user_adress
-- ----------------------------
DROP TABLE IF EXISTS `user_adress`;
CREATE TABLE `user_adress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `usual_adress` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_adress
-- ----------------------------
INSERT INTO `user_adress` VALUES ('1', '1', '100', '河南', '郑州', '经一路');
INSERT INTO `user_adress` VALUES ('2', '1', '101', '河南', '郑州', '经二路');
INSERT INTO `user_adress` VALUES ('3', '1', '102', '河南', '郑州', '经三路');
INSERT INTO `user_adress` VALUES ('4', '2', '103', '河南', '郑州', '经四路');
INSERT INTO `user_adress` VALUES ('5', '2', '104', '河南', '郑州', '经五路');
INSERT INTO `user_adress` VALUES ('6', '3', '105', '河南', '郑州', '经六路');
INSERT INTO `user_adress` VALUES ('7', '3', '106', '河南', '郑州', '经七路');

-- ----------------------------
-- Table structure for user_copy
-- ----------------------------
DROP TABLE IF EXISTS `user_copy`;
CREATE TABLE `user_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `login_count` int(11) DEFAULT NULL,
  `login_error` int(11) DEFAULT NULL,
  `create_ip` varchar(255) DEFAULT NULL,
  `member_integral` int(11) DEFAULT NULL,
  `lock_time` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_copy
-- ----------------------------
INSERT INTO `user_copy` VALUES ('2', null, 'zhangsan', '123abc', null, null, null, null, null, null, null, null, null);
INSERT INTO `user_copy` VALUES ('3', '1', 'aaa', 'aaa', null, null, '2017-06-21 22:40:08', null, null, '10.8.159.43', null, null, 'online');
INSERT INTO `user_copy` VALUES ('4', null, 'bbb', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user_copy` VALUES ('5', null, 'bbb2', 'bbb', null, '18638865126', '2010-10-10 10:10:10', null, null, '10.8.159.43', null, null, 'online');
INSERT INTO `user_copy` VALUES ('6', '1', 'aaa', 'aaa', null, '123456789', '2017-06-22 11:21:58', null, null, '0:0:0:0:0:0:0:1', null, null, 'online');

-- ----------------------------
-- Table structure for user_type
-- ----------------------------
DROP TABLE IF EXISTS `user_type`;
CREATE TABLE `user_type` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  `integral_start` int(11) DEFAULT NULL,
  `integral_end` int(11) DEFAULT NULL,
  `menber_power` float DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_type
-- ----------------------------
INSERT INTO `user_type` VALUES ('1', '普通会员', '0', '1000', '1');
INSERT INTO `user_type` VALUES ('2', '黄金会员', '1000', '3000', '0.9');
INSERT INTO `user_type` VALUES ('3', '钻石会员', '3000', '50000', '0.8');
