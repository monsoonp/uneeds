package com.book.util;

import org.bson.Document;
import org.slf4j.Logger;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

public class MongoUtil {
	private static final Logger logger=org.slf4j.LoggerFactory.getLogger(MongoUtil.class);
	
	//변수
	private static MongoClient mgc;
	//database 가져오기
	public static MongoClient getMondb() {
		if(mgc == null) {
			try {
				mgc=new MongoClient("localhost", 27017); 
			}catch(Exception e) {
				logger.error("getMondb : "+e.getMessage());
			}
		}
		return mgc;
	}
	
	//MongoDatabase 가져오기
	public static MongoDatabase getDb(String dbname) {
		return getMondb().getDatabase(dbname);
	}
	
	//Collection 가져오기
	public static MongoCollection<Document> getCollection(String dbname, String colname) {
		return getDb(dbname).getCollection(colname);
	}
}
