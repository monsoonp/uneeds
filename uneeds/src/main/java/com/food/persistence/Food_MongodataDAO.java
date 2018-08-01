package com.food.persistence;

import org.bson.Document;
import org.springframework.stereotype.Repository;

import com.food.mongos.MongoUtil;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;

@Repository
public class Food_MongodataDAO {
	// Bigbirds SELECT
		public FindIterable<Document> selectBigbirds(String cn) {
			// 컬렉션
			MongoCollection<Document> col = MongoUtil.getCollection("food_database", cn);
			// return
			return col.find();
		}
		
}
