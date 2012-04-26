var ioc={
	dataSource:{
		type:"org.apache.commons.dbcp.BasicDataSource",
		events:{depose:"close"},
		fields:{
			driverClassName:"org.h2.Driver",
			url:"jdbc:h2:/testdb/ttcms;AUTO_SERVER=TRUE",
			username:"sa",
			password:""
		}
	},
	dao:{
		type:"org.nutz.dao.impl.NutDao",
		args:[{refer:"dataSource"}]
	}
}