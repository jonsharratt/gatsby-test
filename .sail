<pipeline>
  <environment>
    <variable
      secret
      name="ZEIT_TOKEN"
      value="CiQA3yzFKmi7mKIgHNpiQVm/ZIMH4AThDU1uoQ3xDxpUN0v3hKcSQQAprFdpNKsH4QIzP1uI2fs9AoZ/qkevJR6Ltee1rctCStfFCO0FuNPcrDwNSH2hP897mESXKE8yPquejkBW1hrQ"
    />
  </environment>
  <job image="node:9.2.1-alpine">
    <Run command="yarn install" />
    <Run command="yarn build" />
    <Branch when="^master$">
      <Run command="cd public" />
      <Run command="yarn global add now" />
      <ZeitNow
        allowPublic
        token="$ZEIT_TOKEN"
        alias="gatsby-demo-sharratt"
      />
    </Branch>
  </job>
</pipeline>

