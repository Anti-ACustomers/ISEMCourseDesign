#include "pch.h"
#include "ClientSocket.h"

ClientSocket::ClientSocket()
	: pDlg(NULL)
{

}

ClientSocket::~ClientSocket() {
	pDlg = NULL;
}

void ClientSocket::SetDialog(CISEMCourseDesignClientDlg* p) {
	pDlg = p;
}

void ClientSocket::OnClose(int nErrorCode)
{
	// TODO: �ڴ����ר�ô����/����û���

	CAsyncSocket::OnClose(nErrorCode);
}


void ClientSocket::OnReceive(int nErrorCode)
{
	// TODO: �ڴ����ר�ô����/����û���

	CAsyncSocket::OnReceive(nErrorCode);
}


void ClientSocket::OnSend(int nErrorCode)
{
	// TODO: �ڴ����ר�ô����/����û���

	CAsyncSocket::OnSend(nErrorCode);
}
