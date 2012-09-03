var ioc={
	dataSource:{
		type:"com.alibaba.druid.pool.DruidDataSource",
		events:{depose:"close"},
		fields:{
			driverClassName:"org.h2.Driver",
			url:"jdbc:h2:/home/tt/usbsync/procdb;AUTO_SERVER=TRUE",
			username:"sa",
			password:""
		}
	},
	dao:{
		type:"org.nutz.dao.impl.NutDao",
		args:[{refer:"dataSource"}]
	}
}