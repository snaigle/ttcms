package com.ttcms.controllers;


import org.nutz.mvc.annotation.IocBy;
import org.nutz.mvc.annotation.Modules;
import org.nutz.mvc.ioc.provider.ComboIocProvider;

@Modules(scanPackage=true)
@IocBy(type= ComboIocProvider.class,args={"*org.nutz.ioc.loader.annotation.AnnotationIocLoader","com.ttcms.services","com.ttcms.controllers"})
public class MainModule {
	
	
}