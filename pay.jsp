<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Cart" %>
<%@ page import="model.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>精算完了</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<%@include file = "header-navi.jsp"%>

	<h2>精算完了</h2>

	<p>お買い上げ ありがとうございました。</p>

	<%
	List<Product> listProd;
			Cart payData = (Cart) session.getAttribute("pay");
			if (payData == null) {
		listProd = new ArrayList<Product>();
			} else {
		listProd = payData.getListProd();
			}
			if (listProd.size() > 0) {
	%>
			<table class="pay-list">
			<tr>
				<th>食材</th><th>季節</th><th>色</th>
			</tr>
	<%
			for (Product prod : listProd) {
	%>
				<tr>
					<td><%=prod.getName() %></td>
					<td><%=prod.getSeason() %></td>
					<td><%=prod.getColor() %></td>
				</tr>			
	<%
			}
	%>
			</table>
	<%
	        payData.totalCountOccurrences();
	%>
			<br>
			<p>赤：<%=payData.getRedPercent() %> % &emsp; &emsp; 黄：<%=payData.getYellowPercent() %> %</p>
			<br>
			<p>白：<%=payData.getWhitePercent() %> %  &emsp; &emsp; 茶：<%=payData.getBrownPercent() %> %</p>			
			<br>
			<p>緑：<%=payData.getGreenPercent() %> %  &emsp; &emsp;  紫：<%=payData.getPurplePercent() %> %</p>
			<br>
			<p>黒：<%=payData.getBlackPercent() %> %</p>
			

	<%
			session.removeAttribute("pay");			// 精算済情報の削除
		} 
	%>

</body>
</html>