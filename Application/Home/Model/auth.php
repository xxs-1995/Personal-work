<?php
namespace Home\Model;
use Think\Model;
class AuthModel extends Model{
protected $patchValidate = true;
protected $_validate = array(
　　　　　　['username','require','请输入用户名'],
      // 在新增的时候验证name字段是否唯一
      ['username','','帐号名称已经存在！',0,'unique',1],
      ['username',"/^[\w\x{4e00}-\x{9fa5}]{3,18}$/u",'用户名长度为3-18位字符',2],
      ['password','require','密码不能为空'],
      ['password',"/^(?=.*[A-Za-z])(?=.*[0-9])[A-Za-z0-9]{6,20}$/",'密码格式不对:必须包含字母+数字,长度6-20字节',0],
      ['repassword','require','确认密码不能为空'],
      ['repassword','password','两次密码不一致',0,'confirm'],
      ['mobile','require','手机号不能为空'],
      ['mobile','/^(0|86|17951)?(13[0-9]|15[012356789]|17[0-9]|18[0-9]|14[57])[0-9]{8}$/','手机号格式不正确',0],
      ['code','require','请输入短信验证码'],
      ['img_code','require','请输入图文验证码'],
      ['email','email','请输入正确的邮箱',0],
      ['email','','邮箱已经存在',0,'unique',1],
      ['mobile','','手机号已经存在',0,'unique',1],
      ['qq','require','请输入qq号'],
      ['qq','/^[1-9][0-9]{5,10}$/','输入正确的qq'],
      ['protocol','1','未选择协议',0,'equal'],
    );
}