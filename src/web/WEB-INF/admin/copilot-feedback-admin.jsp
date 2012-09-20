<%--
  - Author: TCSASSEMBLER
  - Version: 1.0 (Module Assembly - TopCoder Copilot Feedback Integration)
  - Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
  -
  - The admin page for the copilot feedback management
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/includes/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="../includes/htmlhead.jsp"/>
    <ui:dashboardPageType tab="copilotFeedbackAdmin"/>
    <jsp:include page="../includes/paginationSetup.jsp"/>
    <script type="text/javascript" src="/scripts/copilotFeedbackAdmin.js"></script>
</head>

<body id="page">

<div id="wrapper">
<div id="wrapperInner">
<div id="container">
<div id="content">

<jsp:include page="../includes/header.jsp"/>

<div id="mainContent">


<div id="area1"><!-- the main area -->
<div class="area1Content">
<div class="currentPage">
    <a href="<s:url action="dashboardActive" namespace="/"/>" class="home">Dashboard</a> &gt;
    <strong>Feedback Approval</strong>
</div>
<div class="areaHeader">
    <h2 class="title contestTitle">Feedback Approval</h2>
</div>
<!-- End .areaHeader -->

<div class="container2 resultTableContainer" id="copilotFeedbackAdmin">
    <div>
        <table id="copilotFeedback" class="projectStats contests paginatedDataTable resultTable"
               cellpadding="0"
               cellspacing="0">

            <colgroup>
                <col width="19%" />
                <col width="8%" />
                <col />
                <col width="8%" />
                <col width="9%" />
                <col width="9%" />
                <col width="10%" />
            </colgroup>

            <thead>
                <tr>
                    <th>Project Name</th>
                    <th>Copilot</th>
                    <th>Feedback Content</th>
                    <th>Submittor</th>
                    <th>Submit Time</th>
                    <th>Status</th>
                    <th>Operation</th>
                </tr>
            </thead>

            <tbody>

            <s:iterator value="copilotsFeedback"
                        status="status">

                <tr>
                    <input type="hidden" name="copilotProjectId" value="${copilotProjectId}">
                    <input type="hidden" name="feedbackAuthorId" value="${feedback.authorId}">
                    <td class="first">
                        <a target="_blank" href="projectOverview?formData.projectId=${directProjectId}"><s:property value="directProjectName"/></a>
                    </td>
                    <td class="copilotHandle">
                        <link:user userId="${copilotUserId}"/>
                    </td>
                    <td class="copilotFeedback">
                        <b>Would like to work with the copilot?:</b> <span class="feedbackAnswer">${feedback.answer == true ? "YES" : "NO"}</span>   <a class="adminFeedbackEdit" href="javascript:;">Admin Edit</a><br/><br/>
                        <b>Feedback:</b>
                        <span class="feedbackText"><s:property value="feedback.text"/></span>
                    </td>
                    <td>
                        <link:user userId="${feedback.authorId}"/>
                    </td>
                    <td>
                        <s:date name="feedback.submitDate" format="yyyy-MM-dd" />
                    </td>
                    <td class="feedbackStatus <s:if test="feedback.status == 'Rejected'">feedbackRejected</s:if>">
                        <s:property value="feedback.status.toUpperCase()"/>
                    </td>
                    <td class="last">
                        <a href="javascript:;" class="approveButton button1 <s:if test='feedback.status == "Approved"'>hideButton</s:if>"><span class="btnR"><span class="btnC"><span class="btnIcon">Approve</span></span></span></a>
                        <a href="javascript:;" class="rejectButton button1 <s:if test='feedback.status != "Pending"'>hideButton</s:if>"><span class="btnR"><span class="btnC"><span class="btnIcon">&nbsp;&nbsp;Reject&nbsp;&nbsp;</span></span></span></a>
                    </td>

                </tr>
            </s:iterator>

            </tbody>
        </table>
        <!-- End .projectsStats -->

    </div>

    <div class="container2Left">
        <div class="container2Right">
            <div class="container2Bottom">
                <div class="container2BottomLeft">
                    <div class="container2BottomRight">
                        <div class="panel tableControlPanel"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End .container2 -->
</div>
</div>

</div>
<!-- End #mainContent -->

<jsp:include page="../includes/footer.jsp"/>

</div>
<!-- End #content -->
</div>
<!-- End #container -->
</div>

    <div class="popup">
        <div id="modalBackground"></div>
        <div id="new-modal">
            <div id="editCopilotFeedbackModal" class="outLay feedbackModal">
                <div class="inner">
                    <div class="modalHeader">
                        <div class="modalHeaderRight">
                            <div class="modalHeaderCenter">
                                COPILOT FEEDBACK
                                <a href="javascript:;" class="closeModal" title="Close">Close</a>
                            </div>
                        </div>
                    </div>
                    <!-- end .modalHeader -->
                    <!-- content -->
                    <div class="modalBody">
                        <div class="question">
                            <p>Would you like to work with this copilot <span></span> again?</p>
                            <input type="radio" name="workAgain" value="yes"><label>Yes</label>
                            <input type="radio" name="workAgain" value="no"><label>No</label>
                            <span class="errorMessage"> </span>
                        </div>
                        <div class="comment">
                            <p>Your feedback</p>
                            <textarea rows="10" cols="74" style="max-width:613px"></textarea>
                            <p><span class="errorMessage"> </span></p>
                        </div>
                        <div class="buttonArea">
                            <a href="javascript:;" title="SAVE" class="button6 saveButton editNewFeedback"><span class="left"><span class="right">SAVE</span></span></a>
                            <a href="javascript:;" title="CANCEL" class="closebutton button6 cancelButton"><span class="left"><span class="right">CANCEL</span></span></a>
                            <div class="clearFix"></div>
                        </div>
                    </div>
                    <!-- End .content -->

                    <div class="modalFooter">
                        <div class="modalFooterRight">
                            <div class="modalFooterCenter"></div>
                        </div>
                    </div>
                    <!-- end .modalFooter -->
                </div>
            </div>
        </div>
    </div>

</div>
<!-- End #wrapper -->

</body>
<!-- End #page -->

</html>