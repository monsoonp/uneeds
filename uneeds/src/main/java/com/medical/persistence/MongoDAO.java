package com.medical.persistence;

import org.bson.Document;
import org.springframework.stereotype.Repository;

import com.medical.domain.MedicalVO;
import com.medical.mongos.MongoUtil;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;

@Repository
public class MongoDAO {
	//medical insert
	public FindIterable<Document> insertMedicals(MedicalVO m) {
		MongoCollection<Document> col = MongoUtil.getCollection("test", "medical_list");
		Document d = null;
				try {
					d = new Document();
					d.append("num", m.getNum()).append("addr",m.getAddr()).append("name",m.getName()).append("maping", m.getMaping()).append("number", m.getNumber()).append("ms_time", m.getMs_time()).append("mc_time", m.getMc_time()).append("ts_time", m.getTs_time()).append("tc_time", m.getTc_time()).append("ws_time", m.getWs_time()).append("wc_time", m.getWc_time()).append("ths_time", m.getThs_time()).append("thc_time", m.getThc_time()).append("fs_time", m.getFs_time()).append("fc_time", m.getFc_time()).append("ss_time", m.getSs_time()).append("sc_time", m.getSc_time()).append("medicalid", m.getMedicalid()).append("map_x", m.getMap_x()).append("map_y", m.getMap_y());
				} catch (Exception e) {
					 e.getMessage();
				}
				col.insertOne(d);
				
				return (FindIterable<Document>) d;
				
	}

}
