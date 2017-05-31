package com.eot.dao.impl.mybatis;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.eot.dao.IEvaluationTimeDao;
import com.eot.exception.DBException;
import com.eot.model.EvaluationTime;
import com.eot.util.DBUtil;

public class EvaluationTimeDaoImpl extends SqlSessionDaoSupport implements IEvaluationTimeDao{
	
	private static final String CLASS_NAME = EvaluationTime.class.getName();
	private static final String SQL_ID_ADD_THIS_YEAR_EVALUATION_TIME = ".addThisYearEvaluationTime";
	private static final String SQL_ID_GET_THIS_YEAR_START_END_DATE = ".getThisYearStartEndDate";
	private static final String SQL_ID_UPDATE_THIS_YEAR_START_END_DATE = ".updaterStartEndDate";
	
	@Override
	public void addThisYearEvaluationTime(EvaluationTime evaluationTime) {
		//getSqlSession().insert(CLASS_NAME + SQL_ID_ADD_THIS_YEAR_EVALUATION_TIME, evaluationTime);
		Connection conn = DBUtil.getConnection();
		PreparedStatement ps= null;
		ResultSet rs = null;
		
	        try {
	        ps = conn.prepareStatement("INSERT INTO evaluation_time(year, term, start_date, end_date) VALUES(?, ?, ?, ?) ");
	        ps.setString(3, evaluationTime.getStartDate());
            ps.setString(4, evaluationTime.getEndDate());
            ps.setString(1, evaluationTime.getYear());
            ps.setInt(2, evaluationTime.getTerm());

	        ps.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	            throw new DBException();
	        }finally{
	            DBUtil.close(conn, ps, rs);
	        }
	}

	@Override
	public EvaluationTime getThisYearStartEndDate(String year, int term) {
		/*Map<String, Object> params = new HashMap<>();
		params.put("year", year);
		params.put("term", term);
		return getSqlSession().selectOne(CLASS_NAME + SQL_ID_GET_THIS_YEAR_START_END_DATE, params);
		*/
		Connection conn = DBUtil.getConnection();
		PreparedStatement ps= null;
		ResultSet rs = null;
		EvaluationTime evaluationTime = new EvaluationTime();
	        String sql=" SELECT start_date, end_date FROM evaluation_time WHERE year=? AND term=?";

	        try {
	            ps = conn.prepareStatement(sql);
	            ps.setString(1, year);
	            ps.setInt(2, term);
	            rs = ps.executeQuery();
	            if (rs.next()) {
	                evaluationTime.setStartDate(rs.getString("start_date"));
	                evaluationTime.setEndDate(rs.getString("end_date"));
	            }
	        }catch (SQLException e) {
	            e.printStackTrace();
	            throw new DBException();
	        } finally {
	            DBUtil.close(conn, ps, rs);
	        }
	        return evaluationTime;
	   }
		

	@Override
	public void updaterStartEndDate(EvaluationTime evaluationTime) {
		//getSqlSession().update(CLASS_NAME + SQL_ID_UPDATE_THIS_YEAR_START_END_DATE, evaluationTime);
		Connection conn = DBUtil.getConnection();
		PreparedStatement ps= null;
        String sql=" UPDATE evaluation_time SET  start_date = ? , end_date = ? WHERE year = ?  AND	term = ?";

        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, evaluationTime.getStartDate());
            ps.setString(2, evaluationTime.getEndDate());
            ps.setString(3, evaluationTime.getYear());
            ps.setInt(4, evaluationTime.getTerm());
            ps.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
            throw new DBException();
        } finally {
            DBUtil.close(conn, ps);
        }
	}
}
